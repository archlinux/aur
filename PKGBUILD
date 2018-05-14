# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=harmonize
pkgver=0.1.4
pkgrel=1
pkgdesc="Create and synchronize transcoded copies of audio folders."
url="https://github.com/nvllsvm/harmonize"
depends=('ffmpeg' 'flac' 'python')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/f0/7c/c6bd327feba104099472287d4a51ba99f68a8f1c3b9292b424e02ba4f410/harmonize-0.1.4.tar.gz")
sha256sums=('eccbef06ea8ddfcab7bf13ddaf4f830a511b4ac0b49d3288295979a5f8263029')

build() {
  cd harmonize-$pkgver
  python setup.py build
}

package() {
  cd harmonize-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
