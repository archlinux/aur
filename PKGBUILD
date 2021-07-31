# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-nl
pkgver=2.53.8.1
pkgrel=1
_lang=nl
pkgdesc="Dutch language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('0a70cd2b4dfdc3283d5bb2a03f771a6e419eb55158694f138ba66d8fae8bba7635619e6500b5e3c2c3268a0fc22c3a40f7d6ec3904088dcf6a80c1dd4f5d889f')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
