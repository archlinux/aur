# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-fi
pkgver=2.53.8.1
pkgrel=1
_lang=fi
pkgdesc="Finnish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('fd324dd7a47aecf446904fc76c8c039576e6d7c2d977f480848d3da50b599919b85f49b0eb8305e9404422c059541e658806dd57d71e3eaa6e92ecb785c6e746')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
