# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Janosch Dobler <janosch.dobler [at} gmx [dot} de>
pkgname=write_stylus
pkgver=209
pkgrel=3
pkgdesc="Write(orignal name) - A word processor for handwriting"
arch=(i686 x86_64)
url="http://www.styluslabs.com/"
license=('custom')
depends=(qt4 libpng12)
source=("http://www.styluslabs.com/write/write${pkgver}.tar.gz"
		"http://www.styluslabs.com/write/eula.docx"
        "Write.desktop")
md5sums=('57f46eb04a251dabe0b25358cd47e31d'
         'fafaef86844ead59b3837a5909bf780f'
         'eddac9bb586cab9610eb72e030578622')

package() {
  install -Dm755 "$srcdir/Write/Write" "$pkgdir/usr/bin/write_stylus"
  install -Dm644 "$srcdir/eula.docx" "$pkgdir/usr/share/licenses/write_stylus/eula.docx"
  install -Dm644 "$srcdir/Write.desktop" "$pkgdir/usr/share/applications/Write.desktop"
}

# vim:set ts=2 sw=2 et:
