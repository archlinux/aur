# Maintainer: b1f6c1c4 <b1f6c1c4@gmail.com>
pkgname=git-get
pkgver=v0.0
pkgrel=1
pkgdesc="Blazingly fast, incredibly handy git clone alternative"
arch=('any')
url="https://github.com/b1f6c1c4/git-get"
license=('MIT')
depends=('git' 'bash' 'grep' 'sed' 'awk')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname.tar.xz")
sha256sums=('af46f5eeee7227dc2df37de48e9fdcfeae07034b9b20569cbdb60a2a7668b685')

package() {
    mkdir -p "$pkgdir/usr/"
    cp -r "$srcdir/bin" "$pkgdir/usr/"
    cp -r "$srcdir/share" "$pkgdir/usr/"
}
