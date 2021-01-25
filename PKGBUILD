# Maintainer: b1f6c1c4 <b1f6c1c4@gmail.com>
pkgname=git-get
pkgver=v0.1
pkgrel=1
pkgdesc="Blazingly fast, incredibly handy git clone alternative"
arch=('any')
url="https://github.com/b1f6c1c4/git-get"
license=('MIT')
depends=('git' 'bash' 'grep' 'sed' 'awk')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname.tar.xz")
sha256sums=('14c5a0e6e395427c4ae4cb032b6b7caa060eac83ddcc2e446b0482e734a86e9c')

package() {
    mkdir -p "$pkgdir/usr/"
    cp -r "$srcdir/bin" "$pkgdir/usr/"
    cp -r "$srcdir/share" "$pkgdir/usr/"
}
