# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=firefox-extension-gnome-download-notifications
pkgver=1.3.0
pkgrel=1
pkgdesc='Native notification integration for completed downloads addon for Firefox.'
arch=('any')
url='https://addons.mozilla.org/firefox/addon/gnome-download-notifications'
license=('MIT')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/3883473/gnome_download_notifications-${pkgver}.xpi")
sha256sums=('65b8a9de6cd6acbcd0ecda6c7b371204c8f0889b3a3c2f9ade5d3dc9374a4f0d')

package() {
    install -Dm644 ${pkgname}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/gnome-download-notify@ion201.xpi"
}
# vim:set ts=4 sw=4 et:
