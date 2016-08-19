LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := json
LOCAL_EXPORT_C_INCLUDES := $(shell pkg-config --cflags json-c)
LOCAL_EXPORT_LDLIBS := $(shell pkg-config --libs json-c)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := curl
LOCAL_EXPORT_C_INCLUDES := $(shell pkg-config --cflags libcurl)
LOCAL_EXPORT_LDLIBS := $(shell pkg-config --libs libcurl)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := uthash
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libARSAL
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/Config/linux
LOCAL_EXPORT_LDLIBS := -larsal
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libARDiscovery
LOCAL_EXPORT_LDLIBS := -lardiscovery
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libARMavlink
LOCAL_EXPORT_LDLIBS := -larmavlink
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libARNetworkAL
LOCAL_EXPORT_LDLIBS := -larnetworkal
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libARNetwork
LOCAL_EXPORT_LDLIBS := -larnetwork
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libARStream2
LOCAL_EXPORT_LDLIBS := -larstream2
include $(BUILD_PREBUILT)
