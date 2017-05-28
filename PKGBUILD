# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_locale='en-GB'
pkgname=palemoon-i18n-en-gb
pkgver=27.3.1
pkgrel=1
pkgdesc="English British language pack for Pale Moon browser"
arch=('any')
url="https://addons.palemoon.org/language-packs/"
license=('MPL' 'GPL')
source=("${pkgname}-${pkgver}.xpi"::"http://rm-eu.palemoon.org/langpacks/${pkgver/.*/}.x/${_locale}.xpi")
sha256sums=('3862391c642189cd6eb6610f6595844a7943d03d1676d06e2088cc131f003e32')
depends=('palemoon-i18n-common')
noextract=("${pkgname}-${pkgver}.xpi")

package() {
  install -m 755 -d "${pkgdir}/usr/lib/palemoon/browser/extensions"
  install -m 644 "${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/palemoon/browser/extensions/langpack-${_locale}@palemoon.org.xpi"
}

