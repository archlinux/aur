# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-duckduckgo-privacy-essentials
pkgver=2022.12.12
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
sha512sums=('eceaaee55f53ac551cc9a7612181d4bc9fa084b2fbc0c273a1e5b4e3417d997caf6a01f50da6577af6ecee06dda2fda2216c7461e454b12389d728bd225a2cc2')

package() {
    cd ${srcdir}
    install -D -m 644 "${pkgname}-${pkgver}.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/jid1-ZAdIEUB7XOzOJw@jetpack.xpi"
}
# vim:set ts=4 sw=4 et:
