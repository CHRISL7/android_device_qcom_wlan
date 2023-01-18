WLAN_CHIPSET := qca_cld3
 
#WPA
WPA := wpa_cli

PRODUCT_PACKAGES += $(WLAN_CHIPSET)_wlan.ko
PRODUCT_PACKAGES += \
        wificond \
        wifilogd \
        wifilearner
PRODUCT_PACKAGES += $(WPA)
PRODUCT_PACKAGES += ctrlapp_dut

PRODUCT_COPY_FILES += \
	device/qcom/wlan/sdm660_64/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
	device/qcom/wlan/sdm660_64/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
	device/qcom/wlan/sdm660_64/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf \
	frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
	frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml

ifeq ($(GENERIC_ODM_IMAGE),true)
    PRODUCT_COPY_FILES += \
        device/qcom/wlan/sdm660_64/WCNSS_qcom_cfg_odm.ini:$(TARGET_COPY_OUT_ODM)/etc/wifi/WCNSS_qcom_cfg.ini
else
    PRODUCT_COPY_FILES += \
        device/qcom/wlan/sdm660_64/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini
endif

# WLAN specific aosp flag
TARGET_USES_AOSP_FOR_WLAN := false

# Enable STA + SAP Concurrency.
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true

# Enable SAP + SAP Feature.
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
