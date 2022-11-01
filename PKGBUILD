# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=firefox-extension-proxy-switchyomega
pkgver=2.5.20
pkgrel=1
pkgdesc='Proxy SwitchyOmega addon for Firefox.'
arch=('any')
url='https://addons.mozilla.org/firefox/addon/switchyomega/'
license=('GPLV3')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://github.com/FelisCatus/SwitchyOmega/releases/download/v${pkgver}/proxy_switchyomega-${pkgver}-an+fx.xpi")
sha256sums=('360da61f908a00a1900241ede20f8a3f82675b2365cfdf386efa35fb284cca38')

package() {
    install -Dm644 ${pkgname}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/switchyomega@feliscatus.addons.mozilla.org.xpi"
}
# vim:set ts=4 sw=4 et:
