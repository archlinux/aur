# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=v0.18.0-rc.2
_pkgname=egpu-switcher-bin
_pkgver=v0.18.0.rc.2
_sha256sum=d1f51dfc73979c92e407849ca78d93a6963ab6ae5ccf551d638e13992b9d2bf7
_source=${_pkgname}-${_pkgver}::https://github.com/hertg/egpu-switcher/releases/download/v0.18.0-rc.2/egpu-switcher-amd64
pkgname=$_pkgname
pkgver=$_pkgver
pkgdesc='Automatically detect and use eGPU on startup'
pkgrel=1
arch=(x86_64)
license=('GPL')
url='https://github.com/hertg/egpu-switcher'
provides=(egpu-switcher)
conflicts=(egpu-switcher)
install=${pkgname}.install
source=($_source)
sha256sums=($_sha256sum)

package() {
	install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/egpu-switcher"
}
