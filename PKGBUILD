#Maintainer: thilob
pkgname=worldeditor-bin-rc
pkgver=2.5.0r1
pkgrel=1
pkgdesc="WorldEditor (WED) is a CAD-like graphic editor that lets you create custom airport layouts. It is designed for X-Plane, this is the Release Candidate usable for X-Plane 12."
url="http://developer.x-plane.com/tools/worldeditor/"
license=('GPL')
depends=('fltk' 'glu' 'ttf-font')
install='worldeditor-rc.install'
arch=('i686' 'x86_64')
source=("http://dev.x-plane.com/download/tools/wed_lin_${pkgver//\./}.zip"
        "WorldEditor-rc.desktop"
        "WorldEditor-rc.png")
md5sums=('1bcc1042314883aa53104658c4851bde'
         'a1b5b9ed21ef0ba05f553491e2d42321'
         '43f5232cb099f69027f0a1d7e9358cc0')

package() {
  cd "${srcdir}/"
  install -Dm755 "$srcdir"/WED "$pkgdir"/usr/bin/WED-rc
  install -Dm644 "$srcdir"/WorldEditor-rc.desktop "$pkgdir"/usr/share/applications/WorldEditor-rc.desktop
  install -Dm644 "$srcdir"/WorldEditor-rc.png "$pkgdir"/usr/share/pixmaps/WorldEditor-rc.png
}
