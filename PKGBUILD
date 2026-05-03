# Maintainer: rev <rev@example.com>

pkgname=typd-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland virtual keyboard with draggable chrome and key highlighting"
arch=('x86_64')
url="https://github.com/revanthlol/typd"
depends=('wayland' 'cairo' 'libxkbcommon')
provides=('typd')
conflicts=('typd')
source=("typd-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/typd-v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/typd" "$pkgdir/usr/bin/typd"
}
