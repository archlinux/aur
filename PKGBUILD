# Maintainer: Guru <anjanaya@gmail.com>
pkgname=tuicr-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Terminal-based code review tool for AI-generated changes"
arch=('x86_64')
url="https://github.com/agavra/tuicr"
license=('MIT')
provides=('tuicr')
conflicts=('tuicr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/agavra/tuicr/releases/download/v${pkgver}/tuicr-${pkgver}-x86_64-apple-darwin.tar.gz")
sha256sums=('d6b6f050ba88e13af0d027a9c01c1d159bc95c1730791166bd1ba712c943044e')

package() {
    install -Dm755 "${srcdir}/tuicr" "${pkgdir}/usr/bin/tuicr"
}
