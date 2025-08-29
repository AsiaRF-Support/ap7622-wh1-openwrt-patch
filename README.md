How to use:

1. Clone OpenWrt from morse micro's code base. We specify the version of SDK v2.6.6
   (commit hash = 5aaf2b5da7ff80b32115b13139ebf5a63a62576c)

	~$ git clone https://github.com/MorseMicro/openwrt.git
	~$ cd openwrt; git checkout 5aaf2b5da7ff80b32115b13139ebf5a63a62576c

2. Copy this directory (including the root directory) into openwrt directory.
	~$ cp -r patch-ap7622 openwrt/

	The structure of directory should be:
	openwrt
	|-- patch-ap7622
	`-- some openwrt folders

3. In openwrt/patch-ap7622 directory, execute the script.

	~/openwrt/patch-ap7622$ install-asiarf-ap7622.sh

4. The script will install and patch files, prepare the configure,
   including executing morse_setup.sh.

5. Run makefile to build the image. After building, you can get the firmware
   in bin/targets/mediatek/mt7622/ directory.

   ~/openwrt/$ make V=s -j$(($(nproc) + 1))
