pkgname=ts2date
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple tool written in c"
arch=('x86_64')
url="https://github.com/Dum398/ts2date"
license=('GPL')
source=("ts2date.c")
md5sums=('SKIpwdP')

build() {
  gcc ts2date.c -o ts2date
}

package() {
  install -Dm755 ts2date "$pkgdir/usr/bin/ts2date"
}
