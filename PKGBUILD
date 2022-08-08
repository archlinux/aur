# Maintainer: Ifkum Rfnl ifkumrfnl@gmail.com
pkgname='hoholsay'
pkgver=0.1
pkgrel=1
pkgdesc="Cowsay but better"
arch=('any')
url="https://github.com/IfkumRfnl/hoholsay"
license=('GPL')
source=('hoholsay::https://github.com/IfkumRfnl/hoholsay.git')
md5sums=('SKIP')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  cp ./hoholsay "$pkgdir/usr/bin/hoholsay"
}
