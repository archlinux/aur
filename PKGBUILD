# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-fi
pkgver=2.53.23
pkgrel=1
_lang=fi
pkgdesc="Finnish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('0dbafe9163cf9d60133034659297e12772394b407941215131aade5ea6ccfb186cf3c8c90ca40f208d937c9f1acacc9b84c6bddce5d8d13d45544d9b77a9086d')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
