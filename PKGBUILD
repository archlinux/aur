# Maintainer: b1f6c1c4 <b1f6c1c4@gmail.com>
pkgname=git-get
pkgver=v0.2
pkgrel=1
pkgdesc="Blazingly fast, incredibly handy git clone alternative"
arch=('any')
url="https://github.com/b1f6c1c4/git-get"
license=('MIT')
depends=('git' 'bash' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname.tar.xz")
sha256sums=('daeb45c89921c6c43682ee38e4a9b9025fe7aaa60a05a71a8c5b18c8c4048d54')

package() {
    mkdir -p "$pkgdir/usr/"
    cp -r "$srcdir/bin" "$pkgdir/usr/"
    cp -r "$srcdir/share" "$pkgdir/usr/"
}
