# Maintainer: nic96
pkgname=worldeditor-bin
pkgver=1.3.1r1
pkgrel=1
pkgdesc="WorldEditor (WED) is a CAD-like graphic editor that lets you create custom airport layouts. It is designed for X-Plane, and works with apt.dat version 850 and higher."
url="http://developer.x-plane.com/tools/worldeditor/"
license=('GPL')
install='worldeditor.install'
arch=('i686' 'x86_64')
depends=('libcurl-compat')
source=("http://dev.x-plane.com/download/tools/wed_lin_131r1.zip"
        "WorldEditor.desktop"
        "WorldEditor.png")
md5sums=('31726a624f7d56624f5a6fb729317651'
         '39c0422577f37dcf489787a5a6b52830'
         '0efb061145dcfec118afcc6ffff044f1')

package() {
  cd "${srcdir}/"
  install -Dm755 "$srcdir"/WED "$pkgdir"/usr/bin/WED
  install -Dm644 "$srcdir"/WorldEditor.desktop "$pkgdir"/usr/share/applications/WorldEditor.desktop
  install -Dm644 "$srcdir"/WorldEditor.png "$pkgdir"/usr/share/pixmaps/WorldEditor.png
}
