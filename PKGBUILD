# Maintainer: Joan Figueras <ffigue {at} gmail {dot} com>

pkgname=gtk-theme-inspire-ui
_pkgname=feren-theme
pkgver=1.0.4
pkgrel=3
pkgdesc="feren OS theme, based on Arc Theme. Only works in GNOME 3.18+ and also comes with a Cinnamon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1013327/"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' )
_commit=9c9e2585045c169625f1535190f98d9187ae12f9
source=("https://github.com/feren-OS/feren-theme/archive/${_commit}.zip")
md5sums=('0762f9d64d5eab4aef0d5ceb52c2b32f')

package() {
    mkdir -p $pkgdir/usr/share/themes
    cd ${_pkgname}-${_commit}
    cp -r feren{,-dark} $pkgdir/usr/share/themes
}
