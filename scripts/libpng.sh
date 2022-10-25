#!/bin/bash -e
ver=1.6.37

download () {
	get_tar_archive libpng "https://download.sourceforge.net/libpng/libpng-${ver}.tar.gz"
}

build () {
	$srcdir/libpng/configure --host=$CROSS_PREFIX --disable-shared
	make
	make_install_copy
}
