# Maintainer : Sergio Ribera <sergioalejandroriberacosta@gmail.com>

pkgname=super_clipboard
_pkgname=superclipboard
pkgver=2.0.0
pkgrel=1
pkgdesc="Manage your clipboard history with a beautiful and simple interface"
arch=('x86_64')
url="https://github.com/SergioRibera/super_clipboard"
license=('MIT')
depends=()
optdepends=()
makedepends=()
source=("$url/releases/download/v${pkgver}/super_clipboard_x86_64-linux.tar.gz")
sha512sums=('SKIP')

package() {
    install -Dm 755 "$srcdir/super_clipboard" "$pkgdir/usr/bin/$_pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/licenses/$pkgname"
}
