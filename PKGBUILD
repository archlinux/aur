# $Id$
# Maintainer: Thomas Fankhauser <tommy at southdesign dot de>

pkgname=vaulty
pkgver=0.1.0
pkgrel=0
pkgdesc="An open GPG encrypted little vaulty for logins, credentials, etc."
arch=('any')
url="https://github.com/fanktom/vaulty"
license=('BSD')
depends=(
  'zsh'
  'gnupg'
  'xclip'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fanktom/${pkgname}/tarball/${pkgver}")
md5sums=('c98bc91d11a73a60e70e593b2afd6b40')
changelog=ChangeLog

package() {
  install -dm755 "${pkgdir}/usr/share/zsh/plugins/vaulty"
  cp "fanktom-${pkgname}-75dbd0c/vaulty" "${pkgdir}/usr/share/zsh/plugins/${pkgname}/vaulty"
}
