# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-fi
pkgver=2.53.9.1
pkgrel=1
_lang=fi
pkgdesc="Finnish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('f2db1fe919850042b53fdb7f748f18dd788229be2c0d756d4ef7a3df8d9230b3ab7ffe2f47ff1f936e8f5098e13337576dd0a27223977508a0e4a8bc7b2e4b38')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
