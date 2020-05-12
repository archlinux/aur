# Maintainer: Christopher Fair  <christopherpfair@comcast.net>
pkgname=checkpwn
pkgver=1.1.0
pkgrel=5
pkgdesc="Checks whether the account or the password is on the list of compromised accounts."
arch=('i686' 'x86_64')
url="https://github.com/chrisfair/checkpwn/"
license=('MIT')
depends=('git' 'openssl')
makedepends=('git')
source=("https://github.com/chrisfair/checkpwn/releases/download/v${pkgver}/checkpwn.tar.gz")
sha256sums=('7aefa6e2cce2b4b8b5118ede93128aecd4d631fbbe3f2504c14a9bf4184a3a85')
package() {
  cd "${srcdir}"
  echo $(sha256sum checkpwn.tar.gz)
  # app install
  mkdir -p "${pkgdir}/usr/bin"
  install "${srcdir}/${pkgname}" "${pkgdir}/usr/bin"
}


