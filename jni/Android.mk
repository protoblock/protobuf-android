PROTO_PREFIX=/tmp/protobuf-android/
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE    := libprotobuf

LOCAL_SRC_FILES :=\
	$(PROTO_PREFIX)/src/google/protobuf/descriptor_database.cc \
	$(PROTO_PREFIX)/src/google/protobuf/descriptor.cc \
	$(PROTO_PREFIX)/src/google/protobuf/descriptor.pb.cc \
	$(PROTO_PREFIX)/src/google/protobuf/dynamic_message.cc \
	$(PROTO_PREFIX)/src/google/protobuf/extension_set_heavy.cc \
	$(PROTO_PREFIX)/src/google/protobuf/extension_set.cc \
	$(PROTO_PREFIX)/src/google/protobuf/generated_message_reflection.cc \
	$(PROTO_PREFIX)/src/google/protobuf/generated_message_util.cc \
	$(PROTO_PREFIX)/src/google/protobuf/io/coded_stream.cc \
	$(PROTO_PREFIX)/src/google/protobuf/io/gzip_stream.cc \
	$(PROTO_PREFIX)/src/google/protobuf/io/printer.cc \
	$(PROTO_PREFIX)/src/google/protobuf/io/strtod.cc \
	$(PROTO_PREFIX)/src/google/protobuf/io/tokenizer.cc \
	$(PROTO_PREFIX)/src/google/protobuf/io/zero_copy_stream_impl_lite.cc \
	$(PROTO_PREFIX)/src/google/protobuf/io/zero_copy_stream_impl.cc \
	$(PROTO_PREFIX)/src/google/protobuf/io/zero_copy_stream.cc \
	$(PROTO_PREFIX)/src/google/protobuf/message_lite.cc \
	$(PROTO_PREFIX)/src/google/protobuf/message.cc \
	$(PROTO_PREFIX)/src/google/protobuf/reflection_ops.cc \
	$(PROTO_PREFIX)/src/google/protobuf/repeated_field.cc \
	$(PROTO_PREFIX)/src/google/protobuf/stubs/common.cc \
	$(PROTO_PREFIX)/src/google/protobuf/stubs/once.cc \
	$(PROTO_PREFIX)/src/google/protobuf/stubs/stringprintf.cc \
	$(PROTO_PREFIX)/src/google/protobuf/stubs/structurally_valid.cc \
	$(PROTO_PREFIX)/src/google/protobuf/stubs/strutil.cc \
	$(PROTO_PREFIX)/src/google/protobuf/stubs/substitute.cc \
	$(PROTO_PREFIX)/src/google/protobuf/text_format.cc \
	$(PROTO_PREFIX)/src/google/protobuf/unknown_field_set.cc \
	$(PROTO_PREFIX)/src/google/protobuf/wire_format_lite.cc \
	$(PROTO_PREFIX)/src/google/protobuf/wire_format.cc

#$(warning $(TARGET_ARCH))

ifeq ($(TARGET_ARCH),x86)
	LOCAL_SRC_FILES := $(LOCAL_SRC_FILES) \
										 $(PROTO_PREFIX)/src/google/protobuf/stubs/atomicops_internals_x86_gcc.cc
endif
ifeq ($(TARGET_ARCH),x86_64)
	LOCAL_SRC_FILES := $(LOCAL_SRC_FILES) \
										 $(PROTO_PREFIX)/src/google/protobuf/stubs/atomicops_internals_x86_gcc.cc
endif

LOCAL_CFLAGS := -D GOOGLE_PROTOBUF_NO_RTTI=1
LOCAL_CPPFLAGS := -std=c++11
LOCAL_C_INCLUDES = $(LOCAL_PATH)/src

LOCAL_EXPORT_LDLIBS := -lz
LOCAL_EXPORT_CFLAGS := $(LOCAL_CFLAGS)
LOCAL_EXPORT_CPPFLAGS := $(LOCAL_CPPFLAGS)
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES)

include $(BUILD_STATIC_LIBRARY)
