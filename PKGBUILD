# Maintainer: nicholascw
# Contributor: flafflar
# Contributor: nic96
pkgname=worldeditor-bin
pkgver=2.7.2r1
pkgrel=1
pkgdesc="WorldEditor (WED) is a CAD-like graphic editor that lets you create custom airport layouts. It is designed for X-Plane, and works with apt.dat version 850 and higher."
url="http://developer.x-plane.com/tools/worldeditor/"
license=('GPL')
depends=('fltk1.3' 'glu' 'ttf-font')
install='worldeditor.install'
arch=('i686' 'x86_64')
source=("http://files.x-plane.com/public/wed/wed_lin_2.7.2-r1.zip"
        "WorldEditor.desktop"
        "WorldEditor.png")
md5sums=('1798b3900f936fd217b30f23d396892f'
         'b25f4e3cc6a845a457329de93c04c929'
         '0efb061145dcfec118afcc6ffff044f1')

package() {
  cd "${srcdir}/"
  install -Dm755 "$srcdir"/WED "$pkgdir"/usr/bin/WED
  install -Dm644 "$srcdir"/WorldEditor.desktop "$pkgdir"/usr/share/applications/WorldEditor.desktop
  install -Dm644 "$srcdir"/WorldEditor.png "$pkgdir"/usr/share/pixmaps/WorldEditor.png
}
