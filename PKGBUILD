pkgname=gimp-script-make-anaglyph
pkgver=1
pkgrel=1
pkgdesc="makes anaglyph from 2 layers"
arch=(any)
url="http://registry.gimp.org/node/6527"
license=('GPL')
depends=('gimp')
source=(http://registry.gimp.org/files/script-fu-make-anaglyph.scm)
md5sums=('1ecaa7eb4b145883d12e2b680ff75b1a')

package() {
  install -Dm0644 script-fu-make-anaglyph.scm $pkgdir/usr/share/gimp/2.0/scripts/script-fu-make-anaglyph.scm
}
