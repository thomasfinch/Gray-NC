TWEAK_NAME = GrayNC
GrayNC_FILES = Tweak.xm
GrayNC_FRAMEWORKS = UIKit

GO_EASY_ON_ME=1

SDKVERSION := 6.1
TARGET_IPHONEOS_DEPLOYMENT_VERSION := 5.0

THEOS_DEVICE_IP = 67.194.17.40

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
