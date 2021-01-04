pkgname=tunl
pkgver=0.9.1
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('4183ce8482d63f796ccd00d260b59264a3422b017c9e4c9d35e6e5aa1e675516')

package() {
  install -Dm755 $srcdir/tunl $pkgdir/usr/bin/$pkgname
}
