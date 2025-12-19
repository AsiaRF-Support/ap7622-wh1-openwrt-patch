**How to use:**

1. Clone OpenWrt from morse micro's code base. We specify the version of SDK v2.9.3

   (commit hash = b077cd4a1a80184cdd61c54545a89e7e4064002d)

	```
	git clone -b 2.9-dev https://github.com/MorseMicro/openwrt.git
	```

3. Clone and copy this repository into openwrt directory.

	```
 	git clone -b v1.04 https://github.com/AsiaRF-Support/asiarf-openwrt-halow-patch.git
	cp -r asiarf-openwrt-halow-patch openwrt/
	```

	The structure of directory should be:

	openwrt

	|-- asiarf-openwrt-halow-patch

	`-- some openwrt folders

5. In openwrt/asiarf-openwrt-halow-patch directory, execute the script.

	```
	cd openwrt/asiarf-openwrt-halow-patch; bash install.sh <platform>; cd ../
	```
	Currently, available platform:
	------------------------
   | platform | description |
   | -------- | ----------- |
   | <empty>    | initialize only without setting up target platform |
   | ap7622-wh1 | ap7622-wh1 with integrated mm610x chip |
   | ap7621-004 | ap7621-004 with mm610x-cs1 card installed |
   | mm610x-h06-spi-and-sdio | Raspberry4 + MM610X-H06 HAT |
    ------------------------

7. The script will install and patch files, prepare the configuration,
   including executing morse_setup.sh.

8. Run make to build the image. After building, you can get the firmware
   in **bin/targets/** directory.

	```
	make V=s -j$(($(nproc) + 1))
	```
