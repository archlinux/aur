# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=0.18.2
_pkgname=egpu-switcher-bin
_pkgver=0.18.2
_sha256sum=b391efbe805c47cad19ff5691ad69efddc386c72e69ac3d88cd34a120e6e614c
_source=${_pkgname}-${_pkgver}::https://github.com/hertg/egpu-switcher/releases/download/0.18.2/egpu-switcher-amd64
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
