# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=dict-freedict-eng-hun
pkgver=0.1
pkgrel=1
pkgdesc="English - Hungarian dictionary for dictd from Freedict.org"
arch=('any')
url="http://www.freedict.org"
license=('GPL')
options=(!strip !zipman)
groups=()
depends=(dictd)
optdepends=(
  'dict-freedict-hun-eng: Dictionary for the reversed direction.'
)
install=freedict-eng-hun.install
source=("http://sourceforge.net/projects/freedict/files/English%20-%20Hungarian/${pkgver}/freedict-eng-hun-${pkgver}.tar.gz/download")
md5sums=('db5f2558e1d109d295f22377eb673fdd')

package()
{
    mkdir -p "$pkgdir/usr/share/dictd"
    mv "$srcdir/eng-hun/eng-hun.dict.dz" "$srcdir/eng-hun/eng-hun.index" "$pkgdir/usr/share/dictd"
}

