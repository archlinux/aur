# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-sk
pkgver=2.53.12
pkgrel=1
_lang=sk
pkgdesc="Slovak language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('32548af0505e2595962e1be0498b084529b5c2a652a8a67c6d9d815b941365f0925bf9f19e704ee9552399661ff02305f56f27a3e771ade15c55ba18a51ffcd0')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
