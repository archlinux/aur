pkgname=parsimonator
pkgver=1.0.2
pkgrel=2
pkgdesc="A fast open-source parsimony program"
arch=('x86_64')
url="https://github.com/stamatak/Parsimonator-1.0.2"
depends=('gcc-libs')
makedepends=('make' 'gcc' 'git')
license=('unknow')
source=("git+$url.git")
md5sums=('SKIP')

build() {
  cd "${pkgname^}-$pkgver"
  make -f Makefile.gcc
}

package() {
  cd "${pkgname^}-$pkgver"
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}

