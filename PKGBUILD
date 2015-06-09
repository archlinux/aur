# Maintainer: Roberto Mastri <rmastri@liceomalpighi.bo.it>
# Builder: lobisquit <enricolovisotto@gmail.com>

pkgname=webpatente
pkgver=4.2.12
pkgrel=1
pkgdesc="Practise to obtain Italian driving license" 
arch=('i686' 'x86_64')
url="http://www.rmastri.it/"
license=(costum)
# La licenza è disponibile qui: https://www.dropbox.com/s/kgr2e1l6odjwim8/licenza%20webpatente.pdf
case $CARCH in
  "i686") depends=("gtk2" "libxt" "dbus-glib" "alsa-lib");;
  "x86_64") depends=("lib32-gtk2" "lib32-libxt" "lib32-dbus-glib" "lib32-alsa-lib");;
esac

depends+=("desktop-file-utils")
source=("$pkgname-$pkgver-i386.deb::https://www.dropbox.com/s/hqtsv62nrovjg2r/webpatente-4.2.6-i386.deb")
install=$pkgname.install

package () {
  ar x $pkgname-$pkgver-i386.deb
  tar xvf data.tar.gz -C $pkgdir
}

# vim:set ts=2 sw=2 et:
md5sums=('4e3a4a25d88a8ed945196bc2e88d1b16')
