# Maintainer: Sevilze <sevilzcubing@gmail.com>
pkgname=ani2hyprtui-bin
_pkgname=ani2hyprtui
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI tool to convert animated cursors to Hyprcursor format"
arch=('x86_64')
url="https://github.com/Sevilze/ani2hyprtui"
license=('GPL3')
provides=('ani2hypr' 'ani2hyprtui')
conflicts=('ani2hypr' 'ani2hyprtui')
depends=('gcc-libs') 
source=("$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 ani2hyprtui "$pkgdir/usr/bin/ani2hypr"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
