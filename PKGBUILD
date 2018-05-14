# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=harmonize
pkgver=0.1.3
pkgrel=1
pkgdesc="Create and synchronize transcoded copies of audio folders."
url="https://github.com/nvllsvm/harmonize"
depends=('ffmpeg' 'flac' 'python')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/d8/d8/d8bc1a31f81d95695c66e23b8f028f69468f895ec105d945c7f6291156ad/harmonize-0.1.3.tar.gz")
sha256sums=('b2334c70b7e2a8e78049cc796a56c9057a97aadc0106e3d16cd54c22bba6774a')

build() {
  cd harmonize-$pkgver
  python setup.py build
}

package() {
  cd harmonize-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
