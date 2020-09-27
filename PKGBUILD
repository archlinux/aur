# Maintainer: Quentin Bouvet <qbouvet at outlook dot com>
pkgname=bash-timer
pkgver=1.1.0
pkgrel=1
pkgdesc="Human-readable execution time for every command in bash!"
arch=('any')
url="https://github.com/hopeseekr/bash-timer"
license=('APACHE')
depends=('bash-preexec-git')

source=("${pkgname}-${pkgver}::https://github.com/hopeseekr/bash-timer/archive/v${pkgver}.tar.gz")
install=${pkgname}.install
sha256sums=('75e16d41893074c2f57cb2c8dff1e04c8dc74dd8f43ee3917f9a48982d040753')

package() {
  cd "${srcdir}/"
  install -D -m0755 -t "${pkgdir}/usr/share/${pkgname}" \
    "${pkgname}-${pkgver}/${pkgname}.sh"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
