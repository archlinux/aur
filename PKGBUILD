# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-auto-sort-bookmarks
pkgver=3.4.5
pkgrel=1
pkgdesc='Firefox add-on that sorts bookmarks by multiple criteria.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/auto-sort-bookmarks/'
license=('GPLV3')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://github.com/eric-bixby/auto-sort-bookmarks-webext/releases/download/v${pkgver}/auto-sort_bookmarks-${pkgver}.xpi")
sha512sums=('3455537612c35a0769c3a8251be7c8d5f8cdbc0283bd11b7910d02b7f937143d81f5dac3b40346dd346a95e2e9ec6663f43808f6595bc3340e68f9a097bdac45')

package() {
    install -Dm644 ${pkgname}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/sortbookmarks@bouanto.xpi"
}
# vim:set ts=4 sw=4 et:
