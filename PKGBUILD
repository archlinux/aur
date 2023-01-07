# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-uget-integration
pkgver=2.1.3
pkgrel=1
pkgdesc='uGet Download Manager integration extension for Firefox.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/ugetintegration/'
_gh_url='https://github.com/ugetdm/uget-extension'
license=('GPL3')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.zip::${_gh_url}/releases/download/v${pkgver}/uget-integration-firefox.zip")
noextract=("${pkgname}-${pkgver}.zip")
sha512sums=('77a1983445cc9ed055cd0483d92f1041b0fd5a32c03579143ddc290472e6d6c9454475a1c091df12bd09a472f683de2751ccc64dff17615da6237eac4edfb32f')

package() {
    cd ${srcdir}
    install -D -m 644 "${pkgname}-${pkgver}.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/uget-integration@slgobinath.xpi"
}
# vim:set ts=4 sw=4 et:

