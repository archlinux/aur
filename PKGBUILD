# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('psuinfo')
pkgver=1.0
pkgrel=2
pkgdesc="A psutil-based command to display customizable system info, intended for Tint2 or other panels"
arch=('x86_64')
url="https://github.com/nwg-piotr/psuinfo"
license=('GPL3')
depends=('python' 'python-psutil')

source=("https://github.com/nwg-piotr/psuinfo/raw/master/psuinfo-1.0-2"
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/cpu.svg"
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/fan.svg"
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/hdd.svg"
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/mem.svg"
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/swap.svg"
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/temp.svg"
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/up.svg"
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/xfer.svg"
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/xfer-b.svg"
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/xfer-d.svg"
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/xfer-u.svg"
	"https://github.com/nwg-piotr/psuinfo/raw/master/configs/psuinfo-bottom-icons.tint2rc"
	"https://github.com/nwg-piotr/psuinfo/raw/master/configs/psuinfo-bottom-text-single.tint2rc"
	"https://github.com/nwg-piotr/psuinfo/raw/master/configs/psuinfo-bottom-text.tint2rc")

md5sums=('7f0dff0a87d23238bcca2d64ccaa55ec'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
  install -D -m 755 psuinfo-1.0-2 \
 	 "$pkgdir"/usr/bin/psuinfo
  install -D -t "$pkgdir/usr/share/$pkgname" *.svg
  install -D -t "$pkgdir/usr/share/tint2" *.tint2rc
}

