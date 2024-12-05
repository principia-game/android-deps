#!/bin/bash -e
jpeg_ver=3.0.4

download () {
	get_tar_archive libjpeg "https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/${jpeg_ver}/libjpeg-turbo-${jpeg_ver}.tar.gz"
}

build () {
	cmake "${CMAKE_FLAGS[@]}" \
		-DCMAKE_INSTALL_PREFIX=/usr/local \
		-DCMAKE_BUILD_TYPE=Release \
		-DENABLE_SHARED=OFF \
		-DWITH_TURBOJPEG=OFF \
		$srcdir/libjpeg
	make
	make_install_copy
}
