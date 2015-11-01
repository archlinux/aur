# Maintainer: Valerio Pizzi <pival81@yahoo.com>

pkgname=rave-cube-wallpaper-collection-x1
pkgver=1
pkgrel=1
pkgdesc="RAVE Cube Wallpaper Collection is a vivid, vibrant and bold modern wallpaper set"
arch=('any')
url="http://www.ravefinity.com/p/rave-cube-wallpaper-collection-x1.html"
license=('CC')
options=('!strip' '!zipman' 'libtool' 'staticlibs')
source=(http://download2125.mediafire.com/nov39yq0j5ag/uxf9ej82m6nbmnn/RAVE-Cube-Wallpaper-Collection-X1.zip)
md5sums=('d9ebe0aee27a460ae9a804b6176265a9')

package() {
 cd ${srcdir}/RAVE-Cube-Wallpaper-Collection-X1
 mkdir -p $pkgdir/usr/share/backgrounds/
 mv * $pkgdir/usr/share/backgrounds/
}
