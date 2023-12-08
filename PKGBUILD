# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-darkreader
pkgname=$_pkgname-bin
pkgver=4.9.73
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
_number=4205543
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/darkreader-$pkgver.xpi"
        "https://github.com/darkreader/darkreader/raw/main/LICENSE")
sha256sums=('7c399ff32561886bb80dad0cafaf8f629792b0b71ff1efcf12667e05a2b38f1a'
            'SKIP')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 darkreader-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi"
}
