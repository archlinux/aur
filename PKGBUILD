# Maintainer: Fabio Zanini <fabio.zanini@tuebingen.mpg.de>
pkgname=iva
pkgver=0.10.1
pkgrel=1
pkgdesc="Iterative Virus Assembler"
arch=('x86_64')
url="http://sanger-pathogens.github.io/iva/"
license=('GPL')
depends=('python' 'python-pysam' 'python-fastaq' 'python-networkx' 'kmc' 'smalt' 'mummer')
makedepends=('git')
source=('https://github.com/sanger-pathogens/iva/archive/v0.10.1.tar.gz')
md5sums=('cf5ad6b522d4174c9a54f2660d4e7913')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
