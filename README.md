**How to use:**

1. Clone OpenWrt from morse micro's code base. We specify the version of SDK v2.6.6

   (commit hash = 39565282fdea7a8869c001e3db6ba0446574a027)

	```
	git clone https://github.com/MorseMicro/openwrt.git
	cd openwrt/ ; git checkout 39565282fdea7a8869c001e3db6ba0446574a027 ; cd -
	```

3. Clone and copy this repository into openwrt directory.

	```
 	git clone https://github.com/AsiaRF-Support/asiarf-openwrt-halow-patch.git
	cp -r asiarf-openwrt-halow-patch openwrt/
	```

	The structure of directory should be:

	openwrt

	|-- asiarf-openwrt-halow-patch

	`-- some openwrt folders

5. In openwrt/asiarf-openwrt-halow-patch directory, execute the script.

	```
	cd openwrt/asiarf-openwrt-halow-patch; bash install-asiarf-ap7622.sh; cd ../
	```

6. The script will install and patch files, prepare the configuration,
   including executing morse_setup.sh.

7. Run make to build the image. After building, you can get the firmware
   in **bin/targets/mediatek/mt7622/** directory.

	```
	make V=s -j$(($(nproc) + 1))
	```
