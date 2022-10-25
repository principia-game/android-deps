#!/bin/bash -e
ver=2.1.3

download () {
	get_tar_archive libjpeg "https://download.sourceforge.net/libjpeg-turbo/libjpeg-turbo-${ver}.tar.gz"
}

build () {
	cmake $srcdir/libjpeg/ "${CMAKE_FLAGS[@]}" 
	make
	make_install_copy
	# aren't both libraries TURBOO? idk
	rm $pkgdir/libturbojpeg.a
	
}
