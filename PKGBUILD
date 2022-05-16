# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-fi
pkgver=2.53.12
pkgrel=1
_lang=fi
pkgdesc="Finnish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('b3706af62eb3960c47476bd79c31b08980028d481043c7927d2f65c97b11dac829e3e10458c97388771b976d3414cf53212c8885a72cd1fd72e198221e0ea439')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
