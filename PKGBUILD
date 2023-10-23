# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-return-youtube-dislike
pkgname=$_pkgname-bin
pkgver=3.0.0.12
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
_number=4182960
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/return_youtube_dislikes-$pkgver.xpi")
sha256sums=('90a3e492f38f6990109af2496f4e08cd28ca5dcb88f386a01c03b680ff4032f1')

package() {
  install -Dm644 return_youtube_dislikes-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/{762f9885-5a13-4abd-9c77-433dcd38b8fd}.xpi"
}
