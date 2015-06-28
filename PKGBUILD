# Maintainer: Tristelune <tristelune@archlinux.info>

pkgname=hocrconverter-git
_realname=HocrConverter
pkgver=20150121
pkgrel=2
pkgdesc="Python script to create PDFs and plain text from hOCR documents"
arch=('any')
url="http://github.com/tristelune1/HocrConverter"
license=('custom')
depends=('python' 'python-schema' 'python-docopt' 'python-reportlab' 'python-pillow')
makedepends=('git')
source=('git://github.com/tristelune1/HocrConverter.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/$_realname"
  mkdir -p "$pkgdir/usr/share/licenses/hocrconverter/"
  mkdir -p "$pkgdir/usr/bin/"
  cp HocrConverter.py "$pkgdir/usr/bin/"
  cp LICENSE.txt "$pkgdir/usr/share/licenses/hocrconverter/"
}
