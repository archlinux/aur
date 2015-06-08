# Contributor : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname="urxvt-fullscreen"
pkgver=1
pkgrel=1
pkgdesc="script to switch fullscreen and above-other-windows on urxvt"
arch=("any")
depends=('rxvt-unicode' 'wmctrl')
license=("GPL")
url='http://wiki.archlinux.org/index.php/Rxvt-unicode'
source=("fullscreen" )
md5sums=('886bd05ab7931dbf019edd624b591378')
install="$pkgname.install"

package() {
  install -Dm644 ${srcdir}/fullscreen ${pkgdir}/usr/lib/urxvt/perl/fullscreen
}
