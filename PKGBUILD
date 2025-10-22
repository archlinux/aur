# Maintainer: Quentin Bouvet <qbouvet at outlook dot com>
pkgname=bash-timer
pkgver=1.1.0
pkgrel=2
pkgdesc="Human-readable execution time for every command in bash!"
arch=('any')
url="https://github.com/hopeseekr/bash-timer"
license=('APACHE')
depends=('bash-preexec')

source=("${pkgname}-${pkgver}::https://github.com/hopeseekr/bash-timer/archive/v${pkgver}.tar.gz")
install=${pkgname}.install
sha256sums=('1428083d09364a7cbc6bef0f1dd358e781bf05cb71df46db110fa01e63d06925')

package() {
  cd "${srcdir}/"
  install -D -m0755 -t "${pkgdir}/usr/share/${pkgname}" \
    "${pkgname}-${pkgver}/${pkgname}.sh"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
