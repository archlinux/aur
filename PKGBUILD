# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-privacy-pass
pkgver=3.0.5
pkgrel=1
pkgdesc='Firefox extension implements the client-side of the Privacy Pass protocol providing unlinkable cryptographic tokens.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/privacy-pass/'
license=('BSD-3')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/4029152/privacy_pass-${pkgver}.xpi")
sha256sums=('acb6d3001e2af078792bdde7154113dacb9434eb0d55d81e96923b11a0594a9b')

package() {
    install -Dm644 ${pkgname}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{48748554-4c01-49e8-94af-79662bf34d50}.xpi"
}
# vim:set ts=4 sw=4 et:
