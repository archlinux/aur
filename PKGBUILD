pkgname=tunl
pkgver=0.8.0
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('8b7115212c637f73a71fa2b7177f7c1f8e91e5271ffbf8562aae6bc263d251fe')

package() {
  install -Dm755 $srcdir/tunl $pkgdir/usr/bin/$pkgname
}
