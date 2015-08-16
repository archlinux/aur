# Maintainer: Geothermal123 <gus@thegusproject.xyz>

pkgname=zukitwo-manjaro
pkgver=1.0
pkgrel=1
pkgdesc="A green varient of the Zukitwo GTK theme specifically tailored for Manjaro Linux. It works with all GTK 2 and 3 compatible desktop environments and window managers."
arch=('any')
url="https://github.com/Geothermal123/zukitwo-manjaro"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-droid: Font family for the Gnome Shell theme')
source=($pkgname-$pkgver.zip::https://dl.dropboxusercontent.com/u/29821993/zukitwo-manjaro.zip)
sha1sums=SKIP

package() {
  mkdir -p $pkgdir/usr/share/themes
  cd $srcdir
  cp -r $pkgname $pkgdir/usr/share/themes/
  chmod 755 $pkgdir/usr/share/themes/$pkgname

}
