# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=dict-freedict-hun-eng
pkgver=0.3.1
pkgrel=1
pkgdesc="Hungarian - English dictionaries for dictd from Freedict.org"
arch=('any')
url="http://www.freedict.org"
license=('GPL')
options=(!strip !zipman)
groups=()
depends=(dictd)
optdepends=(
  'dict-freedict-eng-hun: Dictionary for the reversed direction.'
)
install=freedict-hun-eng.install
source=("https://downloads.sourceforge.net/project/freedict/Hungarian%20-%20English/$pkgver/freedict-hun-eng-$pkgver.tar.bz2")
md5sums=('dd4098c8041eb8b4dfe59dd0934bfd1c')

package()
{
    mkdir -p "$pkgdir/usr/share/dictd"
    mv "$srcdir/hun-eng/hun-eng.dict.dz" "$srcdir/hun-eng/hun-eng.index" "$pkgdir/usr/share/dictd"
}

