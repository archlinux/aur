# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=0.20.1
_pkgname=egpu-switcher-bin
_pkgver=0.20.1
_sha256sum=b7c62d859cf2403bb4256788f9c519abcf8042ab59c3e58750c12e7cf8d288d5
_source=${_pkgname}-${_pkgver}::https://github.com/hertg/egpu-switcher/releases/download/0.20.1/egpu-switcher-amd64
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
