# Maintainer: Valerio Pizzi <pival81@yahoo.com>

pkgname=rave-wallpaper-collection-1
pkgver=1
pkgrel=1
pkgdesc="RAVE Wallpaper Collection 1 by RAVEfinity"
arch=('any')
url="http://www.ravefinity.com/p/rave-wallpaper-collection.html"
license=('CC')
options=('!strip' '!zipman' 'libtool' 'staticlibs')
source=(https://dl.dropbox.com/u/85873590/RAVE%20Wallpaper%20Collection%201.zip)
md5sums=('1fe634c9a79fb34e5920b2320d8f92ba')

package() {
 mkdir -p $pkgdir/usr/share/backgrounds/
 cd "${srcdir}/RAVE Wallpaper Collection 1/Animals & Nature"
 mv * $pkgdir/usr/share/backgrounds/
 cd "${srcdir}/RAVE Wallpaper Collection 1/Art & Effects"
 mv * $pkgdir/usr/share/backgrounds/
 cd "${srcdir}/RAVE Wallpaper Collection 1/Black & White"
 mv * $pkgdir/usr/share/backgrounds/
 cd "${srcdir}/RAVE Wallpaper Collection 1/City & Modern"
 mv * $pkgdir/usr/share/backgrounds/
 cd "${srcdir}/RAVE Wallpaper Collection 1/Patterns & Textures"
 mv * $pkgdir/usr/share/backgrounds/
}
