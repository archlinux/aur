# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_locale='pt-BR'
pkgname=palemoon-i18n-pt-br
pkgver=27.5.0
pkgrel=1
pkgdesc="Portoguese (Brazil) language pack for Pale Moon browser"
arch=('any')
url="https://addons.palemoon.org/language-packs/"
license=('MPL' 'GPL')
source=("${pkgname}-${pkgver}.xpi"::"http://rm-eu.palemoon.org/langpacks/${pkgver/.*/}.x/${_locale}.xpi")
sha256sums=('c35df36958b1d3b707a582e6bf39345306ff15e99d7b0fc7fe59e7da65f01024')
depends=('palemoon-i18n-common')
noextract=("${pkgname}-${pkgver}.xpi")

package() {
  install -m 755 -d "${pkgdir}/usr/lib/palemoon/browser/extensions"
  install -m 644 "${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/palemoon/browser/extensions/langpack-${_locale}@palemoon.org.xpi"
}

