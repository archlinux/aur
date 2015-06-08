# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: mutantmonkey <mutantmonkey@mutantmonkey.in>

pkgname=firefox-extension-scriptish
pkgver=0.1.11
pkgrel=1
pkgdesc="Firefox add-on for user scripts (fork of Greasemonkey)"
arch=('any')
url="https://addons.mozilla.org/firefox/addon/scriptish/"
license=('MIT')
depends=('firefox')
conflicts=('scriptish')
replaces=('scriptish')
source=("https://addons.cdn.mozilla.net/user-media/addons/231203/scriptish-0.1.11-fx+sm.xpi")
sha256sums=('9c0a5e618da18b1195d2db87883b14394fb408be11a32b028f68adedd98ed2da')

package() {
  install -D $srcdir/*.xpi $pkgdir/usr/lib/firefox/browser/extensions/scriptish@erikvold.com.xpi
  }
