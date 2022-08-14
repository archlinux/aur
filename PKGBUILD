# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('x86_64')
license=('GPL')
depends=('docker')
source=("zeus-${pkgver}.tar.gz::https://github.com/threadexio/zeus/releases/download/v${pkgver}/zeus.tar.gz")
noextract=("zeus-${pkgver}.tar.gz")
sha256sums=('623db7004c05498708b70c91fb288df2ecac995e44bbd197f458b78cbf019abf')
conflicts=(zeus)

package() {
	cd "$srcdir"
	
	tar -axvpf "zeus-${pkgver}.tar.gz" -C "$pkgdir"
}
