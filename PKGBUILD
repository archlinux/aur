# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Scott Garrett <Wintervenom@gmail.com>

pkgname=dmenu-launch
pkgver=0.5.11
pkgrel=1
pkgdesc="A dmenu-based app launcher for X and terminals. Launches binaries and XDG shortcuts."
url='https://github.com/Wintervenom/Scripts/blob/master/file/launch/dmenu-launch'
arch=(any)
license=('GPL')
depends=('dmenu' 'lsx')
source=('https://raw.githubusercontent.com/Wintervenom/Scripts/master/file/launch/dmenu-launch')
sha1sums=('d8059d7fda695bb90152ca341d88ab04a2eeeefa')

package () {
    cd "$srcdir"
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/dmenu-launch" "$pkgdir/usr/bin/dmenu-launch"
}

