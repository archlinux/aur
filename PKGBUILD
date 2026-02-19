# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=jcchess
pkgver=0.0.1
pkgrel=1
pkgdesc="A chess GUI to play against chess engines "
arch=('any')
url="https://johncheetham.com/projects/jcchess/index.html"
license=('GPL-3.0-only')
depends=('python3' 'python-cairo' 'gtk3' 'gdk-pixbuf2' 'python-gobject' 'python-setuptools')
makedepends=('git')
optdepends=('gnuchess: chess engine to play against'
            'stockfish: chess engine to play against'
            'fruit: chess engine to play against')
source=("git+https://github.com/johncheetham/jcchess.git")
sha256sums=('SKIP')

package() {
   cd $srcdir/$pkgname
   python setup.py install --root $pkgdir
}
