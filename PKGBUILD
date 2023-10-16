# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-return-youtube-dislike
pkgname=$_pkgname-bin
pkgver=3.0.0.11
pkgrel=1
pkgdesc='Returns ability to see dislike statistics on youtube (binary release)'
url="https://addons.mozilla.org/addon/return-youtube-dislikes"
arch=('any')
license=('GPL3')
conflicts=($_pkgname)
provides=($_pkgname)
depends=('librewolf')
groups=('librewolf-addons')
noextract=("return_youtube_dislikes-$pkgver.xpi")
_number=4180538
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/return_youtube_dislikes-$pkgver.xpi")
sha256sums=('6d5d3d501a412a994a4b5e667cfb5db98581aee8bf8784c31121867a44895505')

package() {
  install -Dm644 return_youtube_dislikes-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/{762f9885-5a13-4abd-9c77-433dcd38b8fd}.xpi"
}
