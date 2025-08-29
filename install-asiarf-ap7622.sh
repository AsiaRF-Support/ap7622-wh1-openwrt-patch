#!/bin/sh

copy_src() {
	echo "Copy taget files..."
	for file in $SRC_DIR/*; do
		cp -r "$file" "$OPENWRT_DIR"
		 [ $? -eq 0 ] && echo "Copy $file -> $OPENWRT_DIR"
	done
}

apply_patch() {
for patch in "$PATCH_DIR"/*.patch; do
    echo "Applying $patch..."
    patch -N $1 -p1 -d "$OPENWRT_DIR" < "$patch"
done
}

check_dir_exist() {
	[ -d "$1" ] || {
		echo "Error: The directory $1 does not exist. Exit."
		exit 1
	}
}
ROOT_DIR="$PWD"
OPENWRT_DIR="$PWD/.."
SRC_DIR="$ROOT_DIR/src/pre-src"
PATCH_DIR="$ROOT_DIR/patch/pre-patch"
check_dir_exist "$OPENWRT_DIR/boards"
check_dir_exist "$SRC_DIR"
check_dir_exist "$PATCH_DIR"

copy_src
apply_patch

cd $OPENWRT_DIR
./scripts/morse_setup.sh -i -b ap7622

SRC_DIR="$ROOT_DIR/src/post-src"
PATCH_DIR="$ROOT_DIR/patch/post-patch"
check_dir_exist "$SRC_DIR"
check_dir_exist "$PATCH_DIR"

copy_src
apply_patch

cd -
echo "Done."
exit 0
