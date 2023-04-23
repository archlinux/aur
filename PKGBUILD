# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-duckduckgo-privacy-essentials
pkgver=2023.4.11
pkgrel=1
pkgdesc='DuckDuckGo Privacy Essentials browser extension for Firefox.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/duckduckgo-for-firefox/'
_gh_url='https://github.com/duckduckgo/duckduckgo-privacy-extension'
license=('Apache-2')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.zip::${_gh_url}/releases/download/${pkgver}/duckduckgo_privacy_essentials-${pkgver}.zip")
noextract=("${pkgname}-${pkgver}.zip")
sha512sums=('1a56769d23e34e5b50af1d919ef2ed929f321f5e0c98b26c3addc889a1f02873d270c24af513c03f06e232eaaf0197da8856f959d2f155305673c7e050666feb')

package() {
    cd ${srcdir}
    install -D -m 644 "${pkgname}-${pkgver}.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/jid1-ZAdIEUB7XOzOJw@jetpack.xpi"
}
# vim:set ts=4 sw=4 et:
