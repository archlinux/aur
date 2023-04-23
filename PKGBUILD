# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-dont-track-me-google
pkgver=4.27
pkgrel=1
pkgdesc='Firefox extensions to prevent Google from making links ugly.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/dont-track-me-google1/'
license=('MIT')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/3790944/dont_track_me_google1-${pkgver}.xpi")
sha256sums=('259ee0fd1e88ec7c83e8cf2a858dfd04913def8f8e282abc65f0c2226ec0023e')

package() {
    install -Dm644 ${pkgname}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/dont-track-me-google@robwu.nl.xpi"
}
# vim:set ts=4 sw=4 et:
