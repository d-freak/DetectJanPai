FROM ubuntu:16.04

RUN set -x && \
  apt update && \
  apt upgrade -y
RUN set -x && \
  apt install -y \
    git \
    wget
# for bazel
RUN set -x && \
  apt install -y \
    g++ \
    pkg-config \
    python \
    unzip \
    zip \
    zlib1g-dev
# for android-sdk
RUN set -x && \
  apt install -y \
    default-jre
RUN mkdir android/

# install bazel(depends on https://docs.bazel.build/versions/master/install-ubuntu.html#install-with-installer-ubuntu)
## https://github.com/bazelbuild/bazel/releases
ENV BAZEL_VERSION=0.7.0
ENV SH=bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
RUN set -x && \
  wget https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/${SH} && \
  chmod u+x ${SH} && \
  ./${SH} --user && \
  rm -f ${SH}
ENV PATH $PATH:~/bin

# install android-ndk
## https://developer.android.com/ndk/downloads/revision_history.html
ENV NDK_VERSION=15c
ENV NDK_ZIP=android-ndk-r${NDK_VERSION}-linux-x86_64.zip
RUN set -x && \
  wget https://dl.google.com/android/repository/${NDK_ZIP} && \
  unzip -d android/ ${NDK_ZIP} && \
  rm -f ${NDK_ZIP}

# install android-sdk
## https://developer.android.com/studio/releases/build-tools.html
ENV TOOLS_ZIP=sdk-tools-linux-3859397.zip
ENV BUILD_TOOLS_VERSION=26.0.2
ENV API_LEVEL=23

RUN set -x && \
  wget https://dl.google.com/android/repository/${TOOLS_ZIP} && \
  unzip -d android/ ${TOOLS_ZIP} && \
  rm -f ${TOOLS_ZIP} && \
  yes | ./android/tools/bin/sdkmanager --licenses && \
  ./android/tools/bin/sdkmanager "build-tools;${BUILD_TOOLS_VERSION}" && \
  ./android/tools/bin/sdkmanager "platforms;android-${API_LEVEL}"

# get tensorflow
## https://github.com/tensorflow/tensorflow/releases
ENV TENSORFLOW_VERSION=v1.4.0
RUN set -x && \
  git clone -b ${TENSORFLOW_VERSION} https://github.com/tensorflow/tensorflow
WORKDIR tensorflow/
RUN set -x && \
  echo "android_sdk_repository(name = \"androidsdk\", api_level = ${API_LEVEL}, build_tools_version = \"${BUILD_TOOLS_VERSION}\", path = \"/android/\",)" >> WORKSPACE && \
  echo "android_ndk_repository(name = \"androidndk\", path = \"/android/android-ndk-r${NDK_VERSION}/\", api_level=${API_LEVEL})" >> WORKSPACE

ENV BUILD_SHELL=build_android_tensorflow_libs.sh
COPY bin/${BUILD_SHELL} .
RUN set -x && \
  chmod u+x ${BUILD_SHELL}


CMD /bin/bash -l
