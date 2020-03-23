# Maintainer: Ignacy Kuchcinski <ignacykuchcinski@gmail.com>
pkgname=cxxmatrix
pkgver=1.0.0
pkgrel=1
pkgdesc="A C++ based scrolling Matrix digital rain along with other scenes."
arch=('x86_64')
url="https://github.com/akinomyoga/cxxmatrix"
license=('MIT')
depends=('gawk')
provides=('cxxmatrix')
source=("git+https://github.com/akinomyoga/cxxmatrix")
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd "$pkgname"
  make  
}

package() {
  cd "$pkgname"
  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
