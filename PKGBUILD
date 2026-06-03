# Maintainer: Guru <anjanaya@gmail.com>
pkgname=tuicr-bin
pkgver=0.17.1
pkgrel=1
pkgdesc="Terminal-based code review tool for AI-generated changes"
arch=('x86_64')
url="https://github.com/agavra/tuicr"
license=('MIT')
provides=('tuicr')
conflicts=('tuicr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/agavra/tuicr/releases/download/v${pkgver}/tuicr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('90a013bcdc628cf5c50b21cc0efc9f0ae1c74ea41232880656a5ca3fd983c340')

package() {
    install -Dm755 "${srcdir}/tuicr" "${pkgdir}/usr/bin/tuicr"
}
