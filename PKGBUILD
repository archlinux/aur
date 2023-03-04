# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=0.19.0
_pkgname=egpu-switcher-bin
_pkgver=0.19.0
_sha256sum=182ac8dc0bb494856560f9c275cefbf0e9cdaaeace2b9eea317829aaebeed885
_source=${_pkgname}-${_pkgver}::https://github.com/hertg/egpu-switcher/releases/download/0.19.0/egpu-switcher-amd64
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
