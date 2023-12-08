# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=firefox-extension-return-youtube-dislike
pkgname=$_pkgname-bin
pkgver=3.0.0.13
pkgrel=1
pkgdesc='Returns ability to see dislike statistics on youtube (binary release)'
url="https://addons.mozilla.org/addon/return-youtube-dislikes"
arch=('any')
license=('GPL3')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('firefox')
groups=('firefox-addons')
noextract=("return_youtube_dislikes-$pkgver.xpi")
_number=4203985
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/return_youtube_dislikes-$pkgver.xpi")
sha256sums=('599b8761489e90633f258ef1b85fafca8ccca2d84a9c2c5fab31c64dd694191d')

package() {
  install -Dm644 return_youtube_dislikes-$pkgver.xpi "$pkgdir/usr/lib/firefox/browser/extensions/{762f9885-5a13-4abd-9c77-433dcd38b8fd}.xpi"
}
