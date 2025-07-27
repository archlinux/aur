# Maintainer: Ametero <systemlitepro@gmail.com>
pkgname=minsh
pkgver=0.0.1
pkgrel=1
pkgdesc="minsh - Really minimal sh!"
arch=(any)
url="https://github.com/Ameterius/minsh"
license=('MIT')
depends=()
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ameterius/minsh/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('SKIP') 

build(){
   cd "$srcdir/minsh-$pkgver"
   gcc sh.c -O3 -o minsh
}

package(){
   cd "$srcdir/minsh-$pkgver"
   install -Dm755 minsh "$pkgdir/usr/bin/minsh"
}
