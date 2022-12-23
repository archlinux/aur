# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-user-agent-string-switcher
pkgver=0.4.8
pkgrel=1
pkgdesc='Firefox User-Agent spoofer extension that is highly configurable.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/user-agent-string-switcher/'
license=('MPL-2')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/3952467/user_agent_string_switcher-${pkgver}.xpi")
sha256sums=('723a1846f165544b82a97e69000f25ffbe9de312f0a932c1f6c35e54240a03ee')

package() {
    install -Dm644 ${pkgname}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}.xpi"
}
# vim:set ts=4 sw=4 et:
