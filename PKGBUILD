# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname='testssl.sh'
pkgver=2.8
pkgrel=1
pkgdesc="Testing TLS/SSL encryption"
arch=('any')
url="https://github.com/drwetter/testssl.sh"
license=("GPL")
depends=('bash' 'coreutils' 'util-linux' 'openssl')
source=("testssl-${pkgver}.sh::${url}/raw/v${pkgver}/testssl.sh")
sha256sums=('9c39a790bc90ac0e4707ca851ec2d2b9a282467db1ce091a401088692be6923c')

package() {
  cd "${srcdir}"

  install -D -m755 "testssl-${pkgver}.sh" "${pkgdir}/usr/bin/testssl.sh"
}
