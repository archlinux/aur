# Maintainer: Guru <anjanaya@gmail.com>
pkgname=tuicr-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="Terminal-based code review tool for AI-generated changes"
arch=('x86_64')
url="https://github.com/agavra/tuicr"
license=('MIT')
provides=('tuicr')
conflicts=('tuicr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/agavra/tuicr/releases/download/v${pkgver}/tuicr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('f3081e68bf634cb672e7d92249836247c6169cdcb901cb6ced8772098d876a5d')

package() {
    install -Dm755 "${srcdir}/tuicr" "${pkgdir}/usr/bin/tuicr"
}
