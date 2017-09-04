# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=sayonara-bin
_pkgname=sayonara
pkgver=0.9.3
pkgrel=1
pkgdesc="Is a small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=("i686" "x86_64")
url="http://sayonara-player.com"
license=("GPL3")
provides=("sayonara")
conflicts=("sayonara" "sayonara-git" "sayonara-bzr")
depends=("qt5-base" "taglib" "gst-plugins-base" "gst-plugins-good" "gst-plugins-bad" "libmtp")
optdepends=("lame" "gst-plugins-ugly")
source_x86_64=("https://launchpad.net/~lucioc/+archive/ubuntu/${_pkgname}/+files/${_pkgname}_${pkgver}-0ppa4-xenial1_amd64.deb")
source_i686=("https://launchpad.net/~lucioc/+archive/ubuntu/${_pkgname}/+files/${_pkgname}_${pkgver}-0ppa4-xenial1_i386.deb")
md5sums_i686=('4ccf8a46fb42219875fecf745d420aa0')
md5sums_x86_64=('9b0f0236f2202ab6b2404ed3d138d85f')
noextract=("${_pkgname}_${pkgver}*.deb")

package() {
	bsdtar -Oxf $srcdir/${_pkgname}_${pkgver}*.deb --include data.tar.xz  | tar -C $pkgdir -Jxf -
}


