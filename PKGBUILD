# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('psuinfo')
pkgver=0.0.3
pkgrel=1
pkgdesc="A psutil-based command to display customizable system usage info in a single line, intended for Tint2 executors or CLI"
arch=('x86_64')
url="https://github.com/nwg-piotr/psuinfo"
license=('GPL3')
depends=('python' 'python-psutil')

source=(https://github.com/nwg-piotr/psuinfo/raw/master/psuinfo)

md5sums=('e8a9eb7e49acb5466e9a9ca8a89f347d')

package() {
  install -D -m 755 psuinfo \
 	 "$pkgdir"/usr/bin/psuinfo
}

