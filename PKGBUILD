# Maintainer : Sergio Ribera <sergioalejandroriberacosta@gmail.com>

pkgname=super_clipboard
_pkgname=superclipboard
pkgver=2.1.0
pkgrel=1
pkgdesc="Manage your clipboard history with a beautiful and simple interface"
arch=('x86_64')
url="https://github.com/SergioRibera/super_clipboard"
license=('MIT')
depends=()
optdepends=()
makedepends=()
source=("$url/releases/download/v${pkgver}/${_pkgname}_x86_64-linux.tar.gz")
sha512sums=('SKIP')

package() {
    # install binary
    install -Dm 755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
    # install license
    install -Dm 644 LICENSE -t "$pkgdir/licenses/$pkgname"
}
