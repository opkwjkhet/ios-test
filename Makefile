ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
IGNORE_WARNINGS = 0
TARGET = iphone:latest
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Zexis

${TWEAK_NAME}_CFLAGS = -fobjc-arc -std=c++17 -I$(THEOS_PROJECT_DIR)/Lib/Keystone/includes
${TWEAK_NAME}_CCFLAGS = -std=c++17
${TWEAK_NAME}_CXXFLAGS = -std=c++17
${TWEAK_NAME}_FRAMEWORKS = UIKit Foundation QuartzCore
${TWEAK_NAME}_LDFLAGS += $(THEOS_PROJECT_DIR)/Lib/Keystone/arm64/libkeystone.a
${TWEAK_NAME}_CFLAGS += -I$(THEOS_PROJECT_DIR)/Lib/Keystone/includes

${TWEAK_NAME}_FILES = Tweak.mm \
	${wildcard Source/Memory/Kitty/*.cpp} \
	${wildcard Source/Memory/Kitty/*.mm} \
	${wildcard Source/UI/*.mm} \
	${wildcard Source/Memory/Hook/*.mm} \
	${wildcard Source/Memory/Patch/*.mm} \
	${wildcard Source/Memory/Helper.mm} \
	${wildcard Source/Framework/*.mm} \
	${wildcard Source/Memory/Thread/*.mm}

${TWEAK_NAME}_LIBRARIES += substrate

include $(THEOS_MAKE_PATH)/tweak.mk
