_pkgname=build-base
pkgname=alpine-$_pkgname
pkgver=0.5
pkgrel=1
pkgdesc='Meta package for build base in Alpine Linux'
url='http://dev.alpinelinux.org/cgit'
arch=('any')
license=('MIT')
options=('!debug')

depends=(
	binutils
	file
	gcc # which also provides g++
	make
	musl # which provides libc-dev in alpine
	fortify-headers # from the AUR
	patch
)

