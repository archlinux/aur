# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=harmonize
pkgver=0.2.1
pkgrel=1
pkgdesc="Create and synchronize transcoded copies of audio folders."
url="https://github.com/nvllsvm/harmonize"
depends=('flac' 'lame' 'python' 'python-mutagen')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/h/harmonize/harmonize-$pkgver.tar.gz")
sha256sums=('e729f9cc83661ca3d50b1e9e2bb56264e27d987c2729734bb2d41dc10a3f1cc0')

package() {
  cd harmonize-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
