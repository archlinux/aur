# Maintainer: THEGUSPROJECT <gus@thegusproject.xyz>

pkgname=zukitwo-manjaro
pkgver=1.0
pkgrel=1
pkgdesc="A green varient of the Zukitwo GTK theme specifically tailored for Manjaro Linux. It works with all GTK 2 and 3 compatible desktop environments and window managers."
arch=('any')
url="https://github.com/THEGUSPROJECT/zukitwo-manjaro"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-droid: Font family for the Gnome Shell theme')
source=(https://github.com/THEGUSPROJECT/zukitwo-manjaro/blob/master/files/zukitwo-manjaro.zip?raw=true)
sha1sums=SKIP

package() {
  mkdir -p $pkgdir/usr/share/themes
  cd $srcdir
  cp -r $pkgname-master $pkgdir/usr/share/themes/
  chmod -R 755 $pkgdir/usr/share/themes/$pkgname
}
