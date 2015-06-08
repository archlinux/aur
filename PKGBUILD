# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=num-utils
pkgver=0.5
pkgrel=3
pkgdesc="Set of programs for dealing with numbers from the command line."
arch=(i686 x86_64)
license=("GPL")
url="http://suso.suso.org/programs/num-utils/index.phtml"
source=(http://suso.suso.org/programs/num-utils/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('58eed69761c2da97c3bfdfa422633427')

build() {
  cd $srcdir/$pkgname-$pkgver/
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make TOPDIR=${pkgdir}/usr install
}
