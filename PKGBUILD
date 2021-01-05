pkgname=tunl
pkgver=0.10.0
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('a50cbb383c7fc5c5b1e9ad432ab808c9a24ea7a99e73c4b441c398a124fce4d6')

package() {
  install -Dm755 $srcdir/tunl $pkgdir/usr/bin/$pkgname
}
