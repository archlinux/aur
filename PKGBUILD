# Maintainer: Guru <anjanaya@gmail.com>
pkgname=tuicr-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal-based code review tool for AI-generated changes"
arch=('x86_64')
url="https://github.com/agavra/tuicr"
license=('MIT')
provides=('tuicr')
conflicts=('tuicr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/agavra/tuicr/releases/download/v${pkgver}/tuicr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('2ab48ca4dec63c4be01962e630b1753c111ec3fe6b3ea557c8a776c421fc109d')

package() {
    install -Dm755 "${srcdir}/tuicr" "${pkgdir}/usr/bin/tuicr"
}
