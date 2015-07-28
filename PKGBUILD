pkgname=esotope-bfc-git
pkgver=0.1
pkgrel=1
pkgdesc="esotope-bfc, the world's most optimizing Brainfuck-to-something compiler"
arch=('i686' 'x86_64')
url="https://code.google.com/p/esotope-bfc/"
license=('MIT')
provides=('esotope-bfc')
depends=('python2')
makedepends=('mercurial' 'python2-setuptools')
source=("hg+https://bitbucket.org/serialk/esotope-bfc")
sha512sums=(SKIP)

package() {
    cd esotope-bfc
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
