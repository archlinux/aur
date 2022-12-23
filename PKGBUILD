# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-link-gopher
pkgver=2.4.4
pkgrel=1
pkgdesc='Firefox extension for extracting all links from web page, sorting them, removing duplicates, and displaying them in a new tab for inspection or copy and paste into other systems.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/link-gopher/'
license=('GPL3')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/3834730/link_gopher-${pkgver}.xpi")
sha256sums=('3eff3aa755bdfd31b3d26e570d88ce05f0341465e568a03222571b691395c54e')

package() {
    install -Dm644 ${pkgname}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/linkgopher@oooninja.com.xpi"
}
# vim:set ts=4 sw=4 et:
