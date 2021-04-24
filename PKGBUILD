# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>
pkgname=firefox-extension-flagfox
pkgver=6.1.37
pkgrel=1
pkgdesc='Flagfox addon for Firefox'
arch=('any')
url='https://addons.mozilla.org/de/firefox/addon/flagfox/'
license=('GPLV3')
depends=('firefox')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3701933/flagfox-${pkgver}-fx.xpi")
md5sums=('6645b91a46f72e449e007cff17024e2d')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{1018e4d6-728f-4b20-ad56-37578a4de76b}.xpi"
}
