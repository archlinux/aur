# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-fi
pkgver=2.53.5
pkgrel=2
_lang=fi
pkgdesc="Finnish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('2278f96faca2e88f4c736724b3a37e2e27a55a8b4d54c749d06106096da12fab5a3273c55d10c75233ca1f9fb19436c9dd3d55050b198c2d7d989b2ee6ef22c2')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
