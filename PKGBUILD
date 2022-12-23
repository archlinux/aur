# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-fastforward
pkgver=0.1992
pkgrel=1
pkgdesc='Firefox extension that can bypass annoying link shorteners.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/fastforwardteam/'
license=('unlicense')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/3950379/fastforwardteam-${pkgver}.xpi")
sha256sums=('050cce41f8740b6b91519d247bf4b7d4753491629a69f9a71188dc5d36e19efe')

package() {
    install -Dm644 ${pkgname}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/addon@fastforward.team.xpi"
}
# vim:set ts=4 sw=4 et:
