# $Id$
# Maintainer: Thomas Fankhauser <tommy at southdesign dot de>

pkgname=vaulty
pkgver=0.1.0
pkgrel=0
pkgdesc="An open GPG encrypted little vaulty for logins, credentials, etc."
arch=('any')
url="https://github.com/southdesign/vaulty"
license=('BSD')
depends=(
  'zsh'
  'gnupg'
  'xclip'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/southdesign/${pkgname}/tarball/${pkgver}")
md5sums=('b85788a23401dda84722c98baa2b0687')
changelog=ChangeLog

package() {
  install -dm755 "${pkgdir}/usr/share/zsh/plugins/vaulty"
  pwd
  cp "southdesign-${pkgname}-75dbd0c/vaulty" "${pkgdir}/usr/share/zsh/plugins/${pkgname}/vaulty"
}
