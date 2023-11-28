# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-darkreader
pkgname=$_pkgname-bin
pkgver=4.9.70
pkgrel=1
pkgdesc='Dark mode for every website. Take care of your eyes, use dark theme for night and daily browsing (binary release)'
url=https://addons.mozilla.org/addon/darkreader
arch=('any')
license=('MIT')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("darkreader-$pkgver.xpi")
_number=4198549
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/darkreader-$pkgver.xpi"
        "https://github.com/darkreader/darkreader/raw/main/LICENSE")
sha256sums=('3ccbe247031dd4fcc3d9bd840872ed38e9843729709f92803c234041070588a7'
            'SKIP')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 darkreader-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi"
}
