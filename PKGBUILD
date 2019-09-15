# Contributor: ugaciaka <ugaciaka@gmail.com>
# Maintainer : Frederic Bezies <fredbezies@gmail.com>

pkgname=xsane2tess
pkgver=1.0
pkgrel=12
pkgdesc="Script for OCR with tesseract and xsane"
arch=('any')
license=('unknown')
install='xsane2tess.install'
url="http://doc.ubuntu-fr.org/xsane2tess"
depends=('tesseract' 'xsane' 'imagemagick')
makedepends=('git')
source=(git+https://github.com/FredBezies/xsane2tess.git)
sha256sums=('SKIP')

package() {
  install -D -m755 $srcdir/$pkgname/script $pkgdir/usr/bin/xsane2tess
}

