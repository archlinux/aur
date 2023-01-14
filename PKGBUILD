# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-duckduckgo-privacy-essentials
pkgver=2023.1.12
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
sha512sums=('53e90ca72524468a771395dda928a8a71f9f69c101c5c366994f36084f0096727c303781913b58f49adf1e447289955056a1d415cfe2a0492300c97e745e5d2c')

package() {
    cd ${srcdir}
    install -D -m 644 "${pkgname}-${pkgver}.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/jid1-ZAdIEUB7XOzOJw@jetpack.xpi"
}
# vim:set ts=4 sw=4 et:
