How to use:

1. Clone OpenWrt from morse micro's code base. We specify the version of SDK v2.6.6
   (commit hash = 39565282fdea7a8869c001e3db6ba0446574a027)

	```
	git clone https://github.com/MorseMicro/openwrt.git
	cd openwrt/ ; git checkout 39565282fdea7a8869c001e3db6ba0446574a027
	```

2. Copy this directory (including the root directory) into openwrt directory.

	```
	cp -r ap7622-openwrt-patch openwrt/
	```

	The structure of directory should be:
	openwrt
	|-- ap7622-openwrt-patch
	`-- some openwrt folders

3. In openwrt/ap7622-openwrt-patch directory, execute the script.

	```
	cd ap7622-openwrt-patch; bash install-asiarf-ap7622.sh
	```

4. The script will install and patch files, prepare the configure,
   including executing morse_setup.sh.

5. Run make to build the image. After building, you can get the firmware
   in bin/targets/mediatek/mt7622/ directory.

	```
	make V=s -j$(($(nproc) + 1))
	```
