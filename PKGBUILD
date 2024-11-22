# Maintainer: Ole Reglitzki <oleasteo@mailup.net>

pkgname=shlike-toggle
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple bash script to toggle blocks of code within shell-like files (that use '#' for comment lines)."
arch=('any')
url="https://github.com/oleasteo/shlike-toggle"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oleasteo/shlike-toggle/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e911f60fac6843c343c911ffcb18a2b396aad2cec01ed872430ad203ced2094')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/pkg/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
