# Maintainer: Spyros Stathopoulos <spystath@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Juliao Gesse Fernandes <juliao.gf *AT* gmail *DOT* com>

pkgname=scsiadd
pkgver=1.97
pkgrel=4
pkgdesc='Command-line tool for hot add and hot remove SCSI devices from your Linux'
arch=('i686' 'x86_64')
url='http://llg.cubic.org/tools/'
license=('GPL2')
source=("https://llg.cubic.org/tools/$pkgname-$pkgver.tar.gz")
md5sums=('15d3a73411540a40cb1f6d5a97749991')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 ft=sh et:
