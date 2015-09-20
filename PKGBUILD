# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname='testssl.sh'
pkgver=2.6
pkgrel=1
pkgdesc="Testing TLS/SSL encryption"
arch=('any')
url="https://github.com/drwetter/testssl.sh"
license=("GPL")
depends=('bash' 'coreutils' 'util-linux' 'openssl')
source=("testssl-${pkgver}.sh::${url}/raw/${pkgver}/testssl.sh")
sha256sums=('22a10ef9060e23e54d00e75548896635dcdd4340bbf52effd95e59bf39891df0')

package() {
  cd "${srcdir}"

  install -D -m755 "testssl-${pkgver}.sh" "${pkgdir}/usr/bin/testssl.sh"
}
