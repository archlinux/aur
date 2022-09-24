# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=0.18.1
_pkgname=egpu-switcher-bin
_pkgver=0.18.1
_sha256sum=b07504dbc1d27cefb109018ad5302c36e62ddef84e091d12007b6515343b226c
_source=${_pkgname}-${_pkgver}::https://github.com/hertg/egpu-switcher/releases/download/0.18.1/egpu-switcher-amd64
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
