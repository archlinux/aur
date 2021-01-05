pkgname=tunl
pkgver=0.16.1
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('c3a6fad7cefebabe6ed5a2625656184aef10328295273b91c4c94d97ae9baa43')

package() {
  install -Dm755 $srcdir/tunl $pkgdir/usr/bin/$pkgname
}
