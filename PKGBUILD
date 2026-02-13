# Maintainer: Guru <anjanaya@gmail.com>
pkgname=tuicr-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Terminal-based code review tool for AI-generated changes"
arch=('x86_64')
url="https://github.com/agavra/tuicr"
license=('MIT')
provides=('tuicr')
conflicts=('tuicr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/agavra/tuicr/releases/download/v${pkgver}/tuicr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('4b696740e86c2a42d5406ea1adda6e152f902b295c57155f1c92c218e55037f6')

package() {
    install -Dm755 "${srcdir}/tuicr" "${pkgdir}/usr/bin/tuicr"
}
