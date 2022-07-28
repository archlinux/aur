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
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make install
}
