pkgname=markpad
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight GTK3 markdown editor/viewer"
arch=('x86_64')
url="https://github.com/Twilight0/MarkPad"
license=('MIT')
depends=('gtk3')
makedepends=('gcc' 'make' 'pkgconf')
source=("$url/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('9a313eb23cae6ee2a0bdd1a1e38ab734dd3cfa7d0047ab30d365254356eeccbe')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
