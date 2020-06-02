# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-fi
pkgver=2.53.2
pkgrel=1
_lang=fi
pkgdesc="Finnish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('373fbb7cd3bfc322d6a3f71ef75b0b17c5b3866cd72acdcb952076047b71fe56')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
