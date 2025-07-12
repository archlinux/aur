# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-localcdn
pkgname=$_pkgname-bin
pkgver=2.6.80
pkgrel=1
pkgdesc='A web browser extension that emulates CDNs to improve your online privacy (binary release)'
url="https://addons.mozilla.org/addon/localcdn-fork-of-decentraleyes"
arch=('any')
license=('GPL3')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("localcdn_fork_of_decentraleyes-$pkgver.xpi")
_number=4518039
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/localcdn_fork_of_decentraleyes-$pkgver.xpi")
sha256sums=('bcd7e4b51422c3559f3edb880d7248410169214266b3b40d236f0b7d478b9ded')

package() {
  install -Dm644 localcdn_fork_of_decentraleyes-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi"
}
