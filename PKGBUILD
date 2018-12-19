# Maintainer: Christopher Fair  <christopherpfair@comcast.net>
pkgname=checkpwn
pkgver=1.0.0
pkgrel=1
pkgdesc="Checks whether the account or the password is on the list of compromised accounts."
arch=('i686' 'x86_64')
url="https://github.com/chrisfair/checkpwn/"
license=('MIT')
depends=('git' 'openssl')
makedepends=('git')
source=("https://github.com/chrisfair/checkpwn/releases/download/v${pkgver}/checkpwn.tar.gz")
sha1sums=('e964fa35aad39a9dcf54df31ed6ec80bdffab3fc')

package() {
  cd "${srcdir}"
  
  # app install
  mkdir -p "${pkgdir}/usr/bin"
  install "${srcdir}/${pkgname}" "${pkgdir}/usr/bin"
}


