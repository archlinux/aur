# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=firefox-extension-return-youtube-dislike
pkgname=$_pkgname-bin
pkgver=3.0.0.10
pkgrel=1
pkgdesc='Returns ability to see dislike statistics on youtube (binary release)'
url="https://addons.mozilla.org/addon/return-youtube-dislikes"
arch=('any')
license=('GPL3')
conflicts=($_pkgname)
provides=($_pkgname)
depends=('firefox')
groups=('firefox-addons')
noextract=("return_youtube_dislikes-$pkgver.xpi")
_url=https://addons.mozilla.org/firefox/downloads/file/4147411
source=("$_url/return_youtube_dislikes-$pkgver.xpi")
sha256sums=('bcf4a5d271341a3dab3337bd6d5328f762c8b6b3447562316c166f902be3ad84')

package() {
  install -Dm644 return_youtube_dislikes-$pkgver.xpi "$pkgdir/usr/lib/firefox/browser/extensions/{762f9885-5a13-4abd-9c77-433dcd38b8fd}.xpi"
}
