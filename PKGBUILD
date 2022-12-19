# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=firefox-extension-gnome-shell-integration
pkgver=11.1
pkgrel=1
pkgdesc='GNOME shell integration addon for firefox.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/'
license=('GPLV3')
depends=('firefox' 'gnome-browser-connector')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/3974897/gnome_shell_integration-${pkgver}.xpi")
sha512sums=('26495b3eb72795995fb6f157668d97819d3578da59839f6d3cdf24e3b70bf60730763ef5e38d26cfd8c4a95db8ac31c7325524dc469432b46244017fdd450002')

package() {
    cd "${srcdir}"
    install -D  -m644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/chrome-gnome-shell@gnome.org.xpi"
}
# vim:set ts=4 sw=4 et:
