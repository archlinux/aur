# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-dark-reader
pkgname=$_pkgname-bin
pkgver=4.9.67
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web (binary release)'
url=https://addons.mozilla.org/addon/darkreader
arch=('any')
license=('MIT')
conflicts=($_pkgname)
provides=($_pkgname)
depends=('librewolf')
groups=('librewolf-addons')
noextract=("darkreader-$pkgver.xpi")
source=("https://addons.mozilla.org/firefox/downloads/file/4128489/darkreader-$pkgver.xpi")
sha256sums=('128a151f04af774463448fe1cdb944f6c5095fb17991f82d9aec3c8c4513308e')

package() {
  install -Dm644 darkreader-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi"
}
