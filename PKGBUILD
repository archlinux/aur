# Maintainer: Joel Pickett <mail at vyryls dot com>

_pkgname=librewolf-extension-istilldontcareaboutcookies
_id=idcac-pub@guus.ninja
pkgname=$_pkgname-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Debloated fork of the extension I don't care about cookies"
url=https://addons.mozilla.org/en-US/firefox/addon/istilldontcareaboutcookies
arch=('any')
license=('GPLv3')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("istilldontcareaboutcookies-$pkgver.xpi")
_number=4213061
source=("idcac-pub@guus.ninja.xpi::https://addons.mozilla.org/firefox/downloads/file/$_number/istilldontcareaboutcookies-$pkgver.xpi")
sha256sums=('ee931591b4d7d7ba7cc15472dd3de0295d44ef798a14bb5b0159512be53fa126')

package() {
  install -Dm644 $_id.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
}
