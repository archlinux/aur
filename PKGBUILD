# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=harmonize
pkgver=0.2.2
pkgrel=1
pkgdesc="Create and synchronize transcoded copies of audio folders."
url="https://github.com/nvllsvm/harmonize"
depends=('flac' 'lame' 'python' 'python-mutagen')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/h/harmonize/harmonize-$pkgver.tar.gz")
sha256sums=('9f87fb510d37a3aeb8a566a604ecdc811f9353f623e30ea776b5bb646120955d')

package() {
  cd harmonize-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
