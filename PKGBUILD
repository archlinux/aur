# Maintainer: nic96
pkgname=worldeditor-bin
pkgver=1.4.0r2
pkgrel=1
pkgdesc="WorldEditor (WED) is a CAD-like graphic editor that lets you create custom airport layouts. It is designed for X-Plane, and works with apt.dat version 850 and higher."
url="http://developer.x-plane.com/tools/worldeditor/"
license=('GPL')
install='worldeditor.install'
arch=('i686' 'x86_64')
source=("http://dev.x-plane.com/download/tools/wed_lin_${pkgver//\./}.zip"
        "WorldEditor.desktop"
        "WorldEditor.png")
md5sums=('6686ec2fd3ae517ff0602bff99e40d1d'
         'b25f4e3cc6a845a457329de93c04c929'
         '0efb061145dcfec118afcc6ffff044f1')

package() {
  cd "${srcdir}/"
  install -Dm755 "$srcdir"/WED "$pkgdir"/usr/bin/WED
  install -Dm644 "$srcdir"/WorldEditor.desktop "$pkgdir"/usr/share/applications/WorldEditor.desktop
  install -Dm644 "$srcdir"/WorldEditor.png "$pkgdir"/usr/share/pixmaps/WorldEditor.png
}
