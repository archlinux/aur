pkgname=tunl
pkgver=0.18.0
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('3a71e3df92ac32a1db5dfbdd6cbacc0b9ba40be5afdadc122426b08864583725')

package() {
  install -Dm755 $srcdir/tunl $pkgdir/usr/bin/$pkgname
}
