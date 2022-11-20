# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >

pkgname=firefox-extension-gsconnect
pkgver=8
pkgrel=1
pkgdesc='gsconnect addon for firefox.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/gsconnect/'
license=('GPLV3')
depends=('firefox' 'gnome-shell-extension-gsconnect')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/3626312/gsconnect-8.xpi")
sha512sums=('4ff2b1da1495b5f9b5bbd2bf8cfd0fecc5df679c2c144af094410841f23ac3783bdd1655527273ba843801359f67bc648838283f36fdcb9305df30beba4539b0')

package() {
  install -Dm644 ${pkgname}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/gsconnect@andyholmes.github.io.xpi"
}
# vim:set ts=4 sw=4 et:
