# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=harmonize
pkgver=0.2.0
pkgrel=1
pkgdesc="Create and synchronize transcoded copies of audio folders."
url="https://github.com/nvllsvm/harmonize"
depends=('flac' 'lame' 'python' 'python-mutagen')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/b9/67/2d7d042e4ef70e8b9c2a1483b40e1697697ed541cc596c68f418ad44bc88/harmonize-0.2.0.tar.gz")
sha256sums=('41bd50f6f9916f0b437a79c39ac90d3b26289b63eb1d80c05c24555cf1ef122a')

build() {
  cd harmonize-$pkgver
  python setup.py build
}

package() {
  cd harmonize-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
