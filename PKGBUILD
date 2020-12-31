pkgname=tunl
pkgver=0.5.0
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('0d90317f84cc96a1f28adc380008bf913f7d8a0d6a2651aa5170bc7144d87b08')

package() {
  install -Dm755 $srcdir/tunl $pkgdir/usr/bin/$pkgname
}
