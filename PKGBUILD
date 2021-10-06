# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-cs
pkgver=2.53.9.1
pkgrel=1
_lang=cs
pkgdesc="Czech language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('23ba26ca421146591752587e131b62821f94eb4b2260563187835e731ac587e9d4772b946653e673bfc219013a60688ab2728469ca22222bbcfe4b2836fe0a8a')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
