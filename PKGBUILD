# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=harmonize
pkgver=0.1.2
pkgrel=1
pkgdesc="Create and synchronize transcoded copies of audio folders."
url="https://github.com/nvllsvm/harmonize"
depends=('ffmpeg' 'flac' 'python')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/23/19/c19bcbcfa3c24f9069899c4e142c8f8c9fb874832102d5d97e7545896c69/harmonize-0.1.2.tar.gz")
sha256sums=('d7dea0a7b1f832088568248486b465fa64c52a48fb81d90216df5e393aae7727')

build() {
  cd harmonize-$pkgver
  python setup.py build
}

package() {
  cd harmonize-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
