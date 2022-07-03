# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=firefox-extension-flagfox
pkgver=6.1.52
pkgrel=1
pkgdesc='Flagfox addon for Firefox'
arch=('any')
url='https://addons.mozilla.org/de/firefox/addon/flagfox/'
license=('GPLV3')
depends=('firefox')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3969994/flagfox-$pkgver.xpi")
md5sums=('72d7f18e2b7e6c180d182ad314a3e33e')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{1018e4d6-728f-4b20-ad56-37578a4de76b}.xpi"
}
