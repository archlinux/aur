# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=0.18.0
_pkgname=egpu-switcher-bin
_pkgver=0.18.0
_sha256sum=c7cf6e3dbcd41d9cfb5e8f2ff16736476d4600b87198ff0ac5ea6de3cf8397c4
_source=${_pkgname}-${_pkgver}::https://github.com/hertg/egpu-switcher/releases/download/0.18.0/egpu-switcher-amd64
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
