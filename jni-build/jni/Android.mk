LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

TENSORFLOW_CFLAGS	  := \
  -fstack-protector-strong \
  -fpic \
  -ffunction-sections \
  -funwind-tables \
  -no-canonical-prefixes \
  -fno-canonical-system-headers \
  -DHAVE_PTHREAD \
  -Wall \
  -Wwrite-strings \
  -Woverloaded-virtual \
  -Wno-sign-compare \
  '-Wno-error=unused-function' \
  '-std=c++11' \
  -fno-exceptions \
  -DEIGEN_AVOID_STL_ARRAY \
  '-std=c++11' \
  '-DMIN_LOG_LEVEL=0' \
  -DTF_LEAN_BINARY \
  -O2 \
  -Os \
  -frtti \
  -MD \

ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
  TENSORFLOW_CFLAGS	  := $(TENSORFLOW_CFLAGS) \
    '-march=armv8-a' \

else
  TENSORFLOW_CFLAGS	  := $(TENSORFLOW_CFLAGS) \
    '-march=armv7-a' \
    '-mfloat-abi=softfp' \
    '-mfpu=vfpv3-d16' \
    '-mfpu=neon' \

endif
TENSORFLOW_SRC_FILES := ./tensorflow_jni.cc \
	./jni_utils.cc \

LOCAL_MODULE    := tensorflow_mnist
LOCAL_ARM_MODE  := arm
LOCAL_SRC_FILES := $(TENSORFLOW_SRC_FILES)
LOCAL_CFLAGS    := $(TENSORFLOW_CFLAGS)

LOCAL_LDLIBS    := \
	-Wl,-whole-archive \
	$(LOCAL_PATH)/libs/$(TARGET_ARCH_ABI)/libandroid_tensorflow_lib.lo \
	$(LOCAL_PATH)/libs/$(TARGET_ARCH_ABI)/libandroid_tensorflow_kernels.lo \
	$(LOCAL_PATH)/libs/$(TARGET_ARCH_ABI)/libandroid_tensorflow_lib_lite.lo \
	$(LOCAL_PATH)/libs/$(TARGET_ARCH_ABI)/libprotos_all_cc_impl.a \
	$(LOCAL_PATH)/libs/$(TARGET_ARCH_ABI)/libprotobuf.a \
	$(LOCAL_PATH)/libs/$(TARGET_ARCH_ABI)/libprotobuf_lite.a \
	$(LOCAL_PATH)/libs/$(TARGET_ARCH_ABI)/libnsync_cpp.a \
	$(LOCAL_PATH)/libs/$(TARGET_ARCH_ABI)/libfft2d.a \
	-Wl,-no-whole-archive \
	$(NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/4.9/libs/$(TARGET_ARCH_ABI)/libgnustl_static.a \
	$(NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/4.9/libs/$(TARGET_ARCH_ABI)/libsupc++.a \
	-landroid \
	-ljnigraphics \
	-llog \
	-lm \
	-z defs \
	-s \
	-Wl,--exclude-libs,ALL \
	-lz \
	-static-libgcc \
	-no-canonical-prefixes \
	-Wl,-S \

ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
    '-march=armv8-a' \

else
  LOCAL_LDLIBS	  := $(LOCAL_LDLIBS) \
    '-march=armv7-a' \
    '-Wl,--icf=all' \
    -Wl,--fix-cortex-a8 \

endif
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include/tensorflow \
	$(LOCAL_PATH)/genfiles \
	$(LOCAL_PATH)/include/external/protobuf \
	$(LOCAL_PATH)/include/external/bazel \
	$(LOCAL_PATH)/include/external/eigen \
	$(LOCAL_PATH)/include/external/protobuf/src \
	$(LOCAL_PATH)/include/external/bazel/tools/cpp/gcc3 \
	$(LOCAL_PATH)/include/external/nsync/public \

NDK_MODULE_PATH := $(call my-dir)

include $(BUILD_SHARED_LIBRARY)
