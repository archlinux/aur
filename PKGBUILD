# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-return-youtube-dislike
pkgname=$_pkgname-bin
pkgver=3.0.0.9
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
_url=https://addons.mozilla.org/firefox/downloads/file/4107777
source=("$_url/return_youtube_dislikes-$pkgver.xpi")
sha256sums=('025aa38442c58a466382c7dd7796bf5890083a22b091e764566899605c60e1a3')

package() {
  install -Dm644 return_youtube_dislikes-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/{762f9885-5a13-4abd-9c77-433dcd38b8fd}.xpi"
}
