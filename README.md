# Transfer More

## Notes

ldd output (lib requirements): can be used for a transfer-more-bin.

	linux-vdso.so.1 (0x00007fff12bde000)
	libz.so.1 => /usr/lib/libz.so.1 (0x00007fda8da46000)
	libssl.so.1.1 => /usr/lib/libssl.so.1.1 (0x00007fda8d9b1000)
	libcrypto.so.1.1 => /usr/lib/libcrypto.so.1.1 (0x00007fda8d200000)
	libpcre.so.1 => /usr/lib/libpcre.so.1 (0x00007fda8d93a000)
	libm.so.6 => /usr/lib/libm.so.6 (0x00007fda8d519000)
	libgc.so.1 => /usr/lib/libgc.so.1 (0x00007fda8d193000)
	libevent-2.1.so.7 => /usr/lib/libevent-2.1.so.7 (0x00007fda8d13a000)
	libgcc_s.so.1 => /usr/lib/libgcc_s.so.1 (0x00007fda8d4f9000)
	libc.so.6 => /usr/lib/libc.so.6 (0x00007fda8ce00000)
	/lib64/ld-linux-x86-64.so.2 => /usr/lib64/ld-linux-x86-64.so.2 (0x00007fda8daaf000)
	libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007fda8d4f4000)

## Update the package

Run in tranfer_more git repository and set the output on `pkgver`:

    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

Update the source to set the right tag tar gz, and compute the checksum.

Run `makepkg -si` to test the package (build & install).

Run `makepkg --printsrcinfo > .SRCINFO` to refresh srcinfo file.
