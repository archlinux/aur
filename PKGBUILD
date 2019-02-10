_pkgname=betterlockscreen-noeffects
_binname=betterlockscreen
pkgname=$_pkgname
pkgbase=$_pkgname
pkgver=4.0.0
pkgrel=4
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
url="https://github.com/kantord/${_pkgname}"
license=('MIT')
depends=('i3lock-color' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc')
optdepends=('feh: Allows setting wallpaper')
conflicts=("betterlockscreen-git" "betterlockscreen")
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=("3460d5aee160d0a397b04a382bcb8b55")
install=${_binname}.install

package() {
	_srcdir="$srcdir/${_pkgname}-${pkgver}"
	mkdir -p "$pkgdir/usr/bin"
    cp "$_srcdir/$_binname" "$pkgdir/usr/bin/$_binname"
}

