pkgname=univga-bdf
pkgver=1.0
pkgrel=7
pkgdesc="X terminal emulator compatible version of univga (BDF instead of OTB)"
arch=('any')
url="http://www.inp.nsk.su/~bolkhov/files/fonts/univga/"
license=('custom:MIT')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('univga')
source=('http://www.inp.nsk.su/~bolkhov/files/fonts/univga/uni-vga.tgz'
        COPYING)
md5sums=('60fbba53cb0efec1363fcc5fb8c244d9'
         'd7a18e3868102a377d2b8ce92637826b')

package() {
  cd "$srcdir"/uni_vga

  install -m 644 -D u_vga16.bdf \
    "$pkgdir"/usr/share/fonts/local/u_vga16.bdf

  install -m 644 -D "$srcdir"/COPYING \
    "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}

# vim:set ts=2 sw=2 et:
