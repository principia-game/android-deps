#!/bin/bash -e
#ver=9e

download () {
	get_tar_archive libjpeg "https://jpegclub.org/reference/wp-content/uploads/2022/01/jpegsrc.v9e.tar.gz"
}

build () {
	$srcdir/libjpeg/configure --host=$CROSS_PREFIX --disable-shared
	make
	make_install_copy
}
