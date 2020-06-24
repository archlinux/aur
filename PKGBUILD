# Maintainer: timescam <rex.ky.ng at gmail dot com>

_pkgname=canvas
pkgname=$_pkgname-git
pkgver=r19.e74dda7
pkgrel=5
pkgdesc="A bash script to generate and apply different types of gradient & blured wallpapers."
arch=(any)
url="https://github.com/dylanaraps/$_pkgname"
license=("GPL3")
makedepends=("git")
depends=("imagemagick" "feh" "colorpicker")
optdepends=("xorg-xrandr: to use it with xfce")
provides=("$_pkgname")

source=("$_pkgname::git+https://github.com/adi1090x/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
            cd "$srcdir/$_pkgname"
            echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package () {
            install -Dm755 "$srcdir/$_pkgname/canvas" "$pkgdir/usr/bin/canvas"
}
