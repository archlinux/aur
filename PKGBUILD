# Maintainer: Tarcisio Fedrizzi <tarcisio.fedrizzi@gmail.com>

pkgname=python2-seqmagick
pkgver=0.6.0
pkgrel=1
pkgdesc="An imagemagick-like frontend to Biopython SeqIO"
arch=('any')
url="http://seqmagick.readthedocs.org"
license=('GPL')
depends=('python2' 'python2-biopython')
makedepends=()
options=(!emptydirs)
conflicts=('python-seqmagick')
source=("$pkgname.tar.gz::https://github.com/fhcrc/seqmagick/archive/$pkgver.tar.gz")
sha256sums=('4239f7e0478a4a81fd11d4e76994735192c86085090a42d7dc345790904998d3')

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
