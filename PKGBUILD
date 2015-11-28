pkgname=xorg-startx-systemd
pkgver=1
pkgrel=1
pgkdesc='Service files for running startx as systemd user service'
arch=('any')
url='https://github.com/muesli4/archlinux-packages'
depends=('xorg-xinit')
source=('startx.service')

md5sums=('8867c87f0422db611c46c25b8112c976')

#pkgver() {
#    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

package() {
    mkdir -p "$pkgdir/usr/lib/systemd/user/"
    cp 'startx.service' "$pkgdir/usr/lib/systemd/user/"
}

