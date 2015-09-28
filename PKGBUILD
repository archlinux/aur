# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname='testssl.sh'
pkgver=2.6
pkgrel=3
pkgdesc="Testing TLS/SSL encryption"
arch=('any')
url="https://github.com/drwetter/testssl.sh"
license=("GPL")
depends=('bash' 'coreutils' 'util-linux' 'openssl')
source=("testssl-${pkgver}.sh::${url}/raw/v${pkgver}/testssl.sh")
sha256sums=('2f249a3902e691f53f36bb6e0b2244f44276e4ef5e8d47a0146e3d905f2defa9')

package() {
  cd "${srcdir}"

  install -D -m755 "testssl-${pkgver}.sh" "${pkgdir}/usr/bin/testssl.sh"
}
