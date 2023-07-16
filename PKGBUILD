# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-dark-reader
pkgname=$_pkgname-bin
pkgver=4.9.64
pkgrel=1
pkgdesc='Dark mode for every website. Take care of your eyes, use dark theme for night and daily browsing (binary release)'
url=https://addons.mozilla.org/addon/darkreader
arch=('any')
license=('MIT')
depends=('librewolf')
groups=('librewolf-addons')
noextract=("darkreader-$pkgver.xpi")
source=("https://addons.mozilla.org/firefox/downloads/file/4128489/darkreader-$pkgver.xpi")
sha256sums=('c09ed43a96dccab1de3445aac263de0569e3333da330d645094e3f938f13b30e')

package() {
  install -Dm644 darkreader-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi"
}
