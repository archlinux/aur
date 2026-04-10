# Maintainer: xiaoli-white <xiaoli-white-public@outlook.com>
pkgname=rscm-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Reproduceable System Configuration Manager"
arch=('x86_64')
url="https://github.com/rscm-community/rscm"
license=('MIT')
depends=('glibc')
provides=('rscm')
conflicts=('rscm')
source=("$pkgname-$pkgver.tar.xz::https://github.com/rscm-community/rscm/releases/download/v$pkgver/rscm-v$pkgver-x86_64.tar.xz")
sha256sums=('80ac3a613adde9762234e297c0aa25d43f81aba66f2f8301271897ae7166e089')

package() {
    install -Dm755 "$srcdir/rscm" "$pkgdir/usr/bin/rscm"
}
