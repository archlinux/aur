#Maintainer: M0Rf30
pkgname=dashing
pkgver=0.3.0
pkgrel=1
pkgdesc="A Dash Generator Script for Any HTML"
arch=('i686' 'x86_64')
url="https://github.com/technosophos/dashing"
license=('MIT')
depends=()
source=(https://github.com/technosophos/dashing/releases/download/0.3.0/dashing)

package(){
  _bin_dest=usr/bin

  install -Dm755 $srcdir/dashing "$pkgdir/${_bin_dest}/dashing"

}

md5sums=('26285d4771fd9720361fe6504ea8dbc3')
