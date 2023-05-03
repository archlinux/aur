# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('rof-git')
pkgver=0.0.1
pkgrel=4
pkgdesc="Script to launch the command given as an argument if not yet running, else set focus to appropriate window"
arch=('x86_64')
url="https://github.com/nwg-piotr/rof"
license=('GPL3')
depends=('xorg-xprop' 'wmctrl')
source=("https://raw.githubusercontent.com/nwg-piotr/rof/master/rof")

md5sums=('fb15dd09b638276c399a6c022687189a')

package() {
  install -D -m 755 rof \
 	 "$pkgdir"/usr/bin/rof
}
