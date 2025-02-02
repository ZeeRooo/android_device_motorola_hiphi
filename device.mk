#
# Copyright (C) 2022 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Screen
TARGET_SCREEN_DENSITY := 400

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 400dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

BOARD_SHIPPING_API_LEVEL := 31
BOARD_API_LEVEL := 31
PRODUCT_SHIPPING_API_LEVEL := 31

# Inherit from motorola sm8475-common
$(call inherit-product, device/motorola/sm8475-common/sm8475.mk)

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResHiphi \
    LineageSystemUIHiphi \
    SettingsProviderResHiphi \
    SystemUIResHiphi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/sku_taro/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_taro/audio_effects.xml \
    $(LOCAL_PATH)/audio/sku_taro/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_taro/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/sku_taro/mixer_paths_waipio_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_taro/mixer_paths_waipio_mtp.xml \
    $(LOCAL_PATH)/audio/sku_taro/resourcemanager_waipio_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_taro/resourcemanager_waipio_mtp.xml \
    $(LOCAL_PATH)/audio/sku_taro_qssi/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_taro_qssi/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/audio/card-defs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/card-defs.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/microphone_characteristics.xml:$(TARGET_COPY_OUT_VENDOR)/etc/microphone_characteristics.xml \
    $(LOCAL_PATH)/audio/usecaseKvManager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usecaseKvManager.xml

# Init
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/hw/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/bin/*.sh),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/bin/$(notdir $f)))

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.hiphi \
    com.motorola.hardware.biometric.fingerprint@1.0.vendor

$(foreach f,$(wildcard $(LOCAL_PATH)/configs/idc/*.idc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/usr/idc/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/configs/keylayout/*.kl),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/$(notdir $f)))

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/media/media_profiles_taro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_taro.xml

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2.vendor \
    android.hardware.secure_element@1.2.vendor \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_dne/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_dne/android.hardware.se.omapi.ese.xml

# PowerShare
PRODUCT_PACKAGES += \
    vendor.lineage.powershare@1.0-service.hiphi

# Sensors
PRODUCT_PACKAGES += \
    sensors.hiphi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Touch
# PowerShare
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.hiphi

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/hiphi/hiphi-vendor.mk)
