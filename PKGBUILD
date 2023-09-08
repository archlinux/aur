# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-localcdn
pkgname=$_pkgname-bin
pkgver=2.6.55
pkgrel=1
pkgdesc='A web browser extension that emulates CDNs to improve your online privacy (binary release)'
url="https://addons.mozilla.org/addon/localcdn-fork-of-decentraleyes"
arch=('any')
license=('GPL3')
conflicts=($_pkgname)
provides=($_pkgname)
depends=('librewolf')
groups=('librewolf-addons')
noextract=("localcdn_fork_of_decentraleyes-$pkgver.xpi")
_number=4162189
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/localcdn_fork_of_decentraleyes-$pkgver.xpi")
sha256sums=('aebd7587422b508e762fc66c3dbfcad7b90f8777a2f2a119a76ef3ce2ddf484a')

package() {
  install -Dm644 localcdn_fork_of_decentraleyes-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi"
}
