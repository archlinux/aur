# Maintainer: Scott Garrett <Wintervenom@gmail.com>
# Contributor: Scott Garrett <Wintervenom@gmail.com>

pkgname=dmenu-launch
pkgver=0.5.8
pkgrel=2
pkgdesc="A dmenu-based app launcher for X and terminals. Launches binaries and XDG shortcuts."
url="https://github.com/Wintervenom/Scripts/blob/master/file/launch/dmenu-launch"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dmenu' 'lsx')
source=('dmenu-launch')

package () {
    cd "$srcdir"
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/dmenu-launch" "$pkgdir/usr/bin/dmenu-launch"
}

md5sums=('766bc152abd925911b6f087f28ea4177')
