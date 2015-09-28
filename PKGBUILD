# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname='testssl.sh'
pkgver=2.6
pkgrel=4
pkgdesc="Testing TLS/SSL encryption"
arch=('any')
url="https://github.com/drwetter/testssl.sh"
license=("GPL")
depends=('bash' 'coreutils' 'util-linux' 'openssl')
source=("testssl-${pkgver}.sh::${url}/raw/v${pkgver}/testssl.sh")
sha256sums=('3becc36415e836cf5854817133f01eaa6fe0f274791ef05c86538d5fc15493b5')

package() {
  cd "${srcdir}"

  install -D -m755 "testssl-${pkgver}.sh" "${pkgdir}/usr/bin/testssl.sh"
}
