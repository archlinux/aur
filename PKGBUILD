# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-localcdn
pkgname=$_pkgname-bin
pkgver=2.6.56
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
_number=4171609
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/localcdn_fork_of_decentraleyes-$pkgver.xpi")
sha256sums=('8e667e704aad9d92fb4611505b4a5bb008ee17faef1a859c5266f90f47213977')

package() {
  install -Dm644 localcdn_fork_of_decentraleyes-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi"
}
