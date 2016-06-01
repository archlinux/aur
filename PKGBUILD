# Maintainer: orumin <dev@orum.in>

pkgname=coccigrep
provides=('coccigrep')
pkgver=1.16
pkgrel=1
pkgdesc='coccigrep is a semantic grep for the C language based on coccinelle'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='http://nginx.org'
license=('GPL3')
depends=('python-setuptools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/regit/coccigrep/archive/v1.16.tar.gz")
md5sums=('cd8e0ad678ee15d6c8cd1a42a2447412')


build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir/coccigrep-$pkgver"

  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0

}
