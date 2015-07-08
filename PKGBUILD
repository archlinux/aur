# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname='testssl.sh'
pkgver=2.4
pkgrel=0
pkgdesc="Testing TLS/SSL encryption"
arch=('any')
url="https://github.com/drwetter/testssl.sh"
license=("GPL")
depends=('bash' 'coreutils' 'util-linux' 'openssl')
source=("https://github.com/drwetter/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f73afe18d2183e26c0306bd9d85f32e09bb6d938d95d3df5ecee1767e377bd26')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m755 "testssl.sh" "${pkgdir}/usr/bin/testssl.sh"
}
