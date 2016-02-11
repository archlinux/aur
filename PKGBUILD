# Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=ubuntu-device-flash-bin
pkgver=0.33.0ubuntu2
_pkgver=0.33-0ubuntu2 # hyphen is not allowed in pkgver
pkgrel=1
pkgdesc="Tools to work with Ubuntu Touch"
arch=('i686' 'x86_64')
url="https://launchpad.net/goget-ubuntu-touch"
license=('GPL3')
provides=("ubuntu-device-flash")
conflicts=("ubuntu-device-flash")
source_i686=("http://mirrors.kernel.org/ubuntu/pool/universe/g/goget-ubuntu-touch/ubuntu-device-flash_${_pkgver}_i386.deb")
source_x86_64=("http://mirrors.kernel.org/ubuntu/pool/universe/g/goget-ubuntu-touch/ubuntu-device-flash_${_pkgver}_amd64.deb")
md5sums_i686=('f2ba36a0eb5f2c47ce9991b67b6a5cd2')
md5sums_x86_64=('2e8eae2580131af93880872483a45a1a')

package() {
	bsdtar xf data.tar.xz
	chmod -R g-w usr
	mv usr "${pkgdir}"
}
