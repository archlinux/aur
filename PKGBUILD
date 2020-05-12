# Maintainer: Christopher Fair  <christopherpfair@comcast.net>
pkgname=checkpwn
pkgver=1.1.0
pkgrel=1
pkgdesc="Checks whether the account or the password is on the list of compromised accounts."
arch=('i686' 'x86_64')
url="https://github.com/chrisfair/checkpwn/"
license=('MIT')
depends=('git' 'openssl')
makedepends=('git')
source=("https://github.com/chrisfair/checkpwn/releases/download/v${pkgver}/checkpwn.tar.gz")
sha1sums=('5179c0bb1ca9496b6330ca59537755477d8efffd')
package() {
  cd "${srcdir}"
  
  # app install
  mkdir -p "${pkgdir}/usr/bin"
  install "${srcdir}/${pkgname}" "${pkgdir}/usr/bin"
}


