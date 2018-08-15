# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
	ro.qti.sensors.noneui=true \
	ro.xiaomi.sar_fusion=true
    qemu.hw.mainkeys=0 \
    persist.camera.HAL3.enabled=1 \
    persist.sys.force_max_aspect_ratio.enabled=1 \
	persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
	persist.sys.usb.config=mtp,adb \
	sys.usb.controller=a800000.dwc3 \
	sys.usb.rndis.func.name=gsi \
	sys.usb.rmnet.func.name=gsi
