# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=abgd
pkgver=2011_06_10
pkgrel=1
pkgdesc='Automatic Barcode Gap Discovery for primary species delimitation https://doi.org/10.1111/j.1365-294x.2011.05239.x'
arch=('x86_64')
url='https://bioinfo.mnhn.fr/abi/public/abgd/'
license=('LGPL')
source=("$url/last.tgz")
sha1sums=('7147f7105e37d3b8f2a85ed47f4520b148ba4bf4')

build() {
  cd Abgd
  make
}

package() {
  cd Abgd
  install -Dm 755 $pkgname $pkgdir/bin/$pkgname 
}
