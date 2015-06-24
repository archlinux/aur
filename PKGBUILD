pkgname="gututils"
pkgver=$(cat ../../VERSION)
pkgrel=1
pkgdesc="Guten's cmdline utils. PKGBUILD at https://github.com/gutenye/gututils/tree/master/misc/aur"
arch=("any")
url="https://github.com/gutenye/gututils"
license=("MIT")
source=("https://github.com/gutenye/gututils/archive/v${pkgver}.tar.gz")
md5sums=('8b99947620b75b373ec19e10a59acd98')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./ake build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./ake package archlinux "$pkgdir"
}
