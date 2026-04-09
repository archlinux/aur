# Maintainer: hnchengzong
pkgname=hn-filelock-zig-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple file lock tool written in Zig"
arch=('x86_64')
url="https://github.com/hnchengzong/hn-filelock-zig"
license=('MIT')
source=("$url/releases/download/v$pkgver/hn-filelock-zig-x86_64-v$pkgver.pkg.tar.zst")
sha256sums=('e642ce2c72dafb78831d9b03dcb4029938174e0ae570d897990635af19524cb2')
package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
