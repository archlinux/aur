# Maintainer: b1f6c1c4 <b1f6c1c4@gmail.com>
pkgname=git-get
pkgver=v0.3
pkgrel=1
pkgdesc="Blazingly fast, incredibly handy git clone alternative"
arch=('any')
url="https://github.com/b1f6c1c4/git-get"
license=('MIT')
depends=('git' 'bash' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname.tar.xz")
sha256sums=('65c7c9da148dbfc90eb448d3406b26c3ac062878b18e348ca6cbe893d27834e2')

package() {
    mkdir -p "$pkgdir/usr/"
    cp -r "$srcdir/bin" "$pkgdir/usr/"
    cp -r "$srcdir/share" "$pkgdir/usr/"
}
