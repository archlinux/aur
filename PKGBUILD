# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('psuinfo')
pkgver=0.0.3
pkgrel=2
pkgdesc="A psutil-based command to display customizable system usage info in a single line, intended for Tint2 executors or CLI"
arch=('x86_64')
url="https://github.com/nwg-piotr/psuinfo"
license=('GPL3')
depends=('python' 'python-psutil')

source=(https://github.com/nwg-piotr/psuinfo/raw/master/psuinfo)

md5sums=('8dd1d0c548b7bdacf14f6bb2c8d20e5b')

package() {
  install -D -m 755 psuinfo \
 	 "$pkgdir"/usr/bin/psuinfo
}

