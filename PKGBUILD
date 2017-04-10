# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname='testssl.sh'
pkgver=2.8
pkgrel=2
pkgdesc="Testing TLS/SSL encryption"
arch=('any')
url="https://github.com/drwetter/testssl.sh"
license=("GPL")
depends=('bash' 'coreutils' 'util-linux' 'openssl')
source=("testssl-${pkgver}.sh::${url}/raw/v${pkgver}/testssl.sh")
sha256sums=('aa5b9de55f7560a1a1c3ce174d40afd70878b2061aea889dfc9dc28f8883745e')

package() {
  cd "${srcdir}"

  install -D -m755 "testssl-${pkgver}.sh" "${pkgdir}/usr/bin/testssl.sh"
}
