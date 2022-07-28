# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('x86_64')
license=('GPL')
depends=('docker')
source=("zeus-${pkgver}.tar.gz::https://github.com/threadexio/zeus/releases/download/v${pkgver}/zeus.tar.gz")
noextract=("zeus-${pkgver}.tar.gz")
sha256sums=('b58ba819e49673b48cc3a66f3ec33108995b6de0c28fa17e4b94683a50b42130')
conflicts=(zeus)

package() {
	cd "$srcdir"
	
	tar -axvpf "zeus-${pkgver}.tar.gz" -C "$pkgdir"
}
