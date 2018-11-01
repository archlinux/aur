# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('rof-git')
pkgver=0.0.1
pkgrel=2
pkgdesc="Script to launch the command given as an argument if not yet running, else set focus to appropriate window"
arch=('x86_64')
url="https://github.com/nwg-piotr/tint2-executors"
license=('GPL3')
depends=('xorg-xprop' 'wmctrl')
source=("https://raw.githubusercontent.com/nwg-piotr/rof/master/rof")

md5sums=('9cfcb57b864d33e04c80b2d0124724a6')

package() {
  install -D -m 755 rof \
 	 "$pkgdir"/usr/bin/rof
}
