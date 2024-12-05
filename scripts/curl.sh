#!/bin/bash -e
mbedtls_ver=2.28.9
curl_ver=8.11.0

download () {
	get_tar_archive mbedtls "https://github.com/ARMmbed/mbedtls/archive/mbedtls-${mbedtls_ver}.tar.gz"
	get_tar_archive curl "https://curl.se/download/curl-${curl_ver}.tar.gz"
}

build () {
	# Build mbedtls first
	mkdir -p mbedtls
	local mbedtls=$PWD/mbedtls
	pushd $srcdir/mbedtls
	make -s clean # necessary
	make library
	make DESTDIR=$mbedtls install
	popd

	# if you need to debug curl on android, remove the disabling of debug and verbose.
	$srcdir/curl/configure --host=$CROSS_PREFIX \
		--with-mbedtls="$mbedtls" --without-libpsl \
		--disable-shared --enable-static --disable-{debug,verbose} \
		--disable-docs \
		--disable-{alt-svc,ares,basic-auth,bearer-auth,digest-auth,kerberos-auth,negotiate-auth,aws,dateparse,dnsshuffle,doh,hsts,http-auth,manual,netrc,ntlm-wb,progress-meter,proxy,tls-srp,unix-sockets} \
		--disable-{ftp,ldap,ldaps,rtsp,dict,telnet,tftp,pop3,imap,smb,smtp,gopher,mqtt}
	make
	make_install_copy

	# For mbedtls install only the libraries
	cp $mbedtls/lib/*.a $pkgdir/
}
