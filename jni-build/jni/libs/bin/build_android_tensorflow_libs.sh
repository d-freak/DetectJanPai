#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Please put ABI." 1>&2
  echo "Usage $0 (arm64-v8a or armeabi-v7a)" 1>&2
  exit 1
fi
ABI=$1

if [ "$ABI" = 'arm64-v8a' ]; then
  OPTION='--config=android_arm64 --fat_apk_cpu=arm64-v8a'
  LIBS_DIR='android-aarch64-linux-android-clang3.8-gnu-libstdcpp-opt'
else
  OPTION=''
  LIBS_DIR='android-arm-linux-androideabi-clang3.8-v7a-gnu-libstdcpp-opt'
fi
bazel build -c opt $OPTION //tensorflow/examples/android:tensorflow_demo

cp ./bazel-out/$LIBS_DIR/bin/external/fft2d/libfft2d.a \
   ./bazel-out/$LIBS_DIR/bin/external/nsync/libnsync_cpp.a \
   ./bazel-out/$LIBS_DIR/bin/external/protobuf_archive/libprotobuf.a \
   ./bazel-out/$LIBS_DIR/bin/external/protobuf_archive/libprotobuf_lite.a \
   ./bazel-out/$LIBS_DIR/bin/tensorflow/core/kernels/libandroid_tensorflow_kernels.lo \
   ./bazel-out/$LIBS_DIR/bin/tensorflow/core/libandroid_tensorflow_lib.lo \
   ./bazel-out/$LIBS_DIR/bin/tensorflow/core/libandroid_tensorflow_lib_lite.lo \
   ./bazel-out/$LIBS_DIR/bin/tensorflow/core/libprotos_all_cc_impl.a \
   /mnt/
