# Maintainer: Ifkum Rfnl ifkumrfnl@gmail.com
pkgname='hoholsay'
pkgver=0.5
pkgrel=1
pkgdesc="Cowsay but better"
arch=('any')
url="https://github.com/IfkumRfnl/hoholsay"
license=('GPL')
source=('hoholsay::git+https://github.com/IfkumRfnl/hoholsay.git')
md5sums=('SKIP')

build() {
  cd "$srcdir"
  cd hoholsay
  make
}

package() {
  cd "$srcdir"
  cd hoholsay
  install -D -m755 "hoholsay" "$pkgdir/usr/bin/hoholsay"
}
