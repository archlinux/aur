# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-duckduckgo-privacy-essentials
pkgver=2022.12.27
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
sha512sums=('cdf9a049016c45b165a8e3d4190870d1df2a1072d38da82bd675694cf5f13c0c5e3bbb0830938202b9437771740374f0aca4baeeaab9ddc67c01fc8a3746995f')

package() {
    cd ${srcdir}
    install -D -m 644 "${pkgname}-${pkgver}.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/jid1-ZAdIEUB7XOzOJw@jetpack.xpi"
}
# vim:set ts=4 sw=4 et:
