# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-return-youtube-dislike
pkgname=$_pkgname-bin
pkgver=3.0.0.18
pkgrel=1
pkgdesc='Returns ability to see dislike statistics on youtube (binary release)'
url="https://addons.mozilla.org/addon/return-youtube-dislikes"
arch=('any')
license=('GPL3')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('librewolf')
groups=('librewolf-addons')
noextract=("return_youtube_dislikes-$pkgver.xpi")
_number=4371820
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/return_youtube_dislikes-$pkgver.xpi")
sha256sums=('2d33977ce93276537543161f8e05c3612f71556840ae1eb98239284b8f8ba19e')

package() {
  install -Dm644 return_youtube_dislikes-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/{762f9885-5a13-4abd-9c77-433dcd38b8fd}.xpi"
}
