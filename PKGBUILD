# Maintainer: Matt Spaulding <matt@mattops.io>

pkgname=rave-wallpaper-collection-x1
pkgver=20180127
pkgrel=1
pkgdesc="RAVE Wallpaper Collection X1 by RAVEfinity"
arch=('any')
url="http://www.ravefinity.com/p/wallpapers.html"
license=('CC')
options=('!strip' '!zipman' 'libtool' 'staticlibs')
source=('https://drive.google.com/uc?authuser=0&id=0B7iDWdwgu9QAUENKSDV3YmE1eWM&export=download'
        'rave-wallpaper-collection-x1.xml')
sha256sums=('1e7c0875eb7ad68dc7dc5eac68a8397f8798db23480ca1378c98de7264eecdcd'
            '82101379e48bdb1b04575231e2fa6afe7de4f42879255a609a21f180cd0b535b')

package() {
  mkdir -p $pkgdir/usr/share/gnome-background-properties
  cp ${srcdir}/rave-wallpaper-collection-x1.xml $pkgdir/usr/share/gnome-background-properties/
  mkdir -p $pkgdir/usr/share/backgrounds/rave-wallpaper-collection-x1
  cd "${srcdir}/RAVE-Cube-Wallpaper-Collection-X1"
  cp * $pkgdir/usr/share/backgrounds/rave-wallpaper-collection-x1/
}
