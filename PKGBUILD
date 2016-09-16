# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=sayonara-bin
_pkgname=sayonara
pkgver=0.9.1
pkgrel=1
pkgdesc="Is a small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=("i686" "x86_64")
url="http://sayonara-player.com"
license=("GPL3")
depends=("qt5-base" "taglib" "gst-plugins-base" "gst-plugins-good" "gst-plugins-bad" "libmtp")
optdepends=("lame" "gst-plugins-ugly")
source_x86_64=("https://launchpad.net/~lucioc/+archive/ubuntu/${_pkgname}/+files/${_pkgname}_${pkgver}-0ppa4-xenial1_amd64.deb")
source_i686=("https://launchpad.net/~lucioc/+archive/ubuntu/${_pkgname}/+files/${_pkgname}_${pkgver}-0ppa4-xenial1_i386.deb")
md5sums_x86_64=("5aec21d0afc3afb645591b1ddc65e07a")
md5sums_i686=("9a67b779c1f8e4ec56d5a1049d6fcec3")
noextract=("")

package() {
	bsdtar -Oxf $srcdir/${_pkgname}_${pkgver}*.deb --include data.tar.xz  | tar -C $pkgdir -Jxf -
}


