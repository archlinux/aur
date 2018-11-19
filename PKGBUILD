# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('psuinfo')
pkgver=0.0.7
pkgrel=3
pkgdesc="A psutil-based command to display customizable system info, intended for Tint2 or other panels"
arch=('x86_64')
url="https://github.com/nwg-piotr/psuinfo"
license=('GPL3')
depends=('python' 'python-psutil')

source=("https://github.com/nwg-piotr/psuinfo/raw/master/psuinfo-0.0.7-3"
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
	"https://github.com/nwg-piotr/psuinfo/raw/master/icons/xfer-u.svg")

md5sums=('5e2e969978e581bcc5373fff24ea88f8'
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
  install -D -m 755 psuinfo-0.0.7-3 \
 	 "$pkgdir"/usr/bin/psuinfo
  install -D -t "$pkgdir/usr/share/$pkgname" *.svg
}

