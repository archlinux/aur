# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=0.18.0-rc.1
_pkgname=egpu-switcher-bin
_pkgver=0.18.0.rc.1
_sha256sum=9733e406e2f391be5e3e7941c24877910575d2738cdcae65368e36a43beabc80
_source=${_pkgname}-${_pkgver}::https://github.com/hertg/egpu-switcher/releases/download/0.18.0-rc.1/egpu-switcher-amd64
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
