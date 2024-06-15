#!/bin/bash -e
sdl2_ver=2.30.3

download () {
	get_tar_archive sdl2 "https://github.com/libsdl-org/SDL/releases/download/release-${sdl2_ver}/SDL2-${sdl2_ver}.tar.gz"
}

build () {
	# SDL2
	cmake $srcdir/sdl2 "${CMAKE_FLAGS[@]}" \
		-DSDL_SHARED=OFF \
		-DSDL_TEST=OFF \
		-DSDL_RENDER=OFF \
		-DSDL_VULKAN=OFF
		
	make
	make_install_copy
}
