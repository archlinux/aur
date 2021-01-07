pkgname=tunl
pkgver=0.17.2
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('3e11cbc43b5fcfb08e5c66a3a595fcc6c07f8894b538a55cd3dcc7aa4e63c047')

package() {
  install -Dm755 $srcdir/tunl $pkgdir/usr/bin/$pkgname
}
