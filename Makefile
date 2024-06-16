THEOS_DEVICE_IP = 192.168.1.12 -p 22
ARCHS = arm64 arm64e armv7
#define TARGET 
GO_EASY_ON_ME = 1
FINALPACKAGE = 1
DEBUG = 0
THEOS = /var/mobile/theos
# 0 để xử lý cảnh báo như lỗi, 1 nếu không.
IGNORE_WARNINGS = 1


include $(THEOS)/makefiles/common.mk

# Tên của Tweak
TWEAK_NAME = AOV

# CFLAGS và LDFLAGS cho Tweak
$(TWEAK_NAME)_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
$(TWEAK_NAME)_CFLAGS += -fobjc-arc
$(TWEAK_NAME)_FILES += CYLIGHT1/cylightteam001.m $(shell find SCLAlertView -name '*.m')
$(TWEAK_NAME)_FRAMEWORKS = UIKit \
    Foundation \
    Security \
    QuartzCore \
    CoreGraphics \
    CoreText \
    CoreData \
    CoreLocation \
    CoreMotion \
    CoreBluetooth \
    CoreImage \
    CoreML \
    ARKit \
    Metal \
    WebKit \
    GameController \
    AdSupport \
    UserNotifications \
    StoreKit \
    GameKit \
    AVFoundation \
    MobileCoreServices \
    CoreTelephony \
    SystemConfiguration \
    MediaPlayer \
    AddressBook \
    MobileCoreServices \
    MessageUI \
    WebKit \
    ReplayKit \
    UserNotifications \
    AuthenticationServices \
    GameKit \
    LocalAuthentication \
    Accounts \
    MapKit \
    AppTrackingTransparency \
    MetricKit \
    SystemConfiguration \
    CoreLocation \
    Metal \
    CoreMotion \
    Security \
    MediaToolbox \
    CoreText \
    AudioToolbox \
    AVFoundation \
    CoreGraphics \
    CoreMedia \
    Foundation \
    OpenAL \
    OpenGLES
LIBRARIES += substrate mobilesubstrate

# Bao gồm các file Makefile cần thiết
include $(THEOS_MAKE_PATH)/tweak.mk

# Lệnh sau khi cài đặt dự án sẽ kill ứng dụng kgvn để áp dụng thay đổi
after-install::
    install.exec "killall -9 kgvn || :"
	@rm -rf $(OBJDIR) $(THEOS_OBJ_DIR)
