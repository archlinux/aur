# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-localcdn
pkgname=$_pkgname-bin
pkgver=2.6.58
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
_number=4197044
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/localcdn_fork_of_decentraleyes-$pkgver.xpi")
sha256sums=('693c8d5286fbc5a5e7c06cd11da1ae2d060fde7c2f06a390ccdc621b5b9c67eb')

package() {
  install -Dm644 localcdn_fork_of_decentraleyes-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi"
}
