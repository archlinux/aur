# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-uget-integration
pkgver=2.1.3.1
pkgrel=1
pkgdesc='uGet Download Manager integration extension for Firefox.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/ugetintegration/'
license=('GPL3')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/911315/ugetintegration-${pkgver}.xpi")
sha512sums=('1df2a903bd520b065a02cb448ced3ea321bf0b7d85b84836be63b7d6c56a6bab9d23f480cd11ff1f3265ea3df2b01b7634e793321fd8e249942a367d2f0b4928')

package() {
    cd ${srcdir}
    install -D -m 644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/uget-integration@slgobinath.xpi"
}
# vim:set ts=4 sw=4 et:

