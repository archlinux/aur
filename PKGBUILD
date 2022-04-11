# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=firefox-extension-flagfox
pkgver=6.1.49
pkgrel=1
pkgdesc='Flagfox addon for Firefox'
arch=('any')
url='https://addons.mozilla.org/de/firefox/addon/flagfox/'
license=('GPLV3')
depends=('firefox')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3929226/flagfox-${pkgver}-fx.xpi")
md5sums=('b17e92ae5c388552bb3528d4f04fc81f')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{1018e4d6-728f-4b20-ad56-37578a4de76b}.xpi"
}
