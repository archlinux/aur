# Maintainer: Peter Babič <babicpet at gmail dot com>
pkgname=mtnm
pkgver=2012.05.23
pkgrel=6
pkgdesc="Moves window to next monitor / screen"
arch=(any)
url="http://icyrock.com/blog/2012/05/xubuntu-moving-windows-between-monitors/"
license=('custom')
depends=('xdotool' 'wmctrl' 'xorg-xdpyinfo' 'xorg-xprop' 'xorg-xwininfo' )
source=('mtnm')
md5sums=('c64f49268124746d83eb634aa6b9bbd0')

package() {
    install -Dm755 "mtnm" "$pkgdir/usr/bin/mtnm"
}
