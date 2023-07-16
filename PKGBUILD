# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-uget-integration
pkgname=$_pkgname-bin
pkgver=2.1.3.1
pkgrel=1
pkgdesc='Integrate LibreWolf with uGet download manager (binary release)'
url="https://addons.mozilla.org/addon/ugetintegration"
arch=('any')
license=('GPL3')
conflicts=($_pkgname)
provides=($_pkgname)
depends=('librewolf')
groups=('librewolf-addons')
noextract=("ugetintegration-$pkgver.xpi")
source=("https://addons.mozilla.org/firefox/downloads/file/911315/ugetintegration-$pkgver.xpi")
sha256sums=('235f29ca5df79e4e5a338e29ef7cd721bb7873309b56364cc7a4bf4612e1ae85')

package() {
  install -Dm644 ugetintegration-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/uget-integration@slgobinath.xpi"
}
