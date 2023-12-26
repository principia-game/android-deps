#!/bin/bash -e
ver=2.13.2

download () {
	get_tar_archive freetype "https://sourceforge.net/projects/freetype/files/freetype2/${ver}/freetype-${ver}.tar.xz"
}

build () {
	$srcdir/freetype/configure --host=$CROSS_PREFIX \
		--enable-static --disable-shared \
		--with-png=no \
		--with-harfbuzz=no \
		--with-bzip2=no
	make

	make_install_copy
}
