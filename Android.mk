LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := wayland-scanner
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES :=		\
	src/wayland-util.c \
	src/scanner.c
LOCAL_SHARED_LIBRARIES := libexpat-host
LOCAL_C_INCLUDES := $(topdir)/expat/lib

include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_CLANG := false

LOCAL_MODULE := libwayland-client

protocol/wayland-client-protocol.h: wayland-scanner
    $(shell $(LOCAL_PATH)/generate-protocol.sh $(LOCAL_PATH))

LOCAL_SRC_FILES :=	src/wayland-client.c \
			src/wayland-util.c \
			src/wayland-os.c \
			src/connection.c \
			protocol/wayland-protocol.c

LOCAL_C_INCLUDES := $(LOCAL_PATH)/protocol $(LOCAL_PATH)/src external/libffi/linux-arm

LOCAL_SHARED_LIBRARIES := libffi

include $(BUILD_SHARED_LIBRARY)
