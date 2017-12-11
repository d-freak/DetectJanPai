#!/bin/bash
ABI='arm64-v8a'
LIBS=`ls $ABI`

if [ -n "$LIBS" ]; then
  echo "$ABI libraries was built." 1>&2
  exit 0
fi
CURRENT_DIRECTORY=`basename $(pwd)`

if [ "$CURRENT_DIRECTORY" != 'libs' ]; then
  echo "please change directory to 'jni-build/jni/libs'." 1>&2
  exit 1
fi
DOCKER_PATH=`which docker`

if [ ! -n "$DOCKER_PATH" ]; then
  echo "please install docker." 1>&2
  exit 1
fi
DOCKER_TAG='build_android_tensorflow_libs'

docker build -t $DOCKER_TAG .
docker run -v `pwd`/$ABI:/mnt --rm $DOCKER_TAG ./build_android_tensorflow_libs.sh $ABI
