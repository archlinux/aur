# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-phonopy')
pkgver=2.23.1
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://github.com/phonopy/phonopy"
license=('BSD')
depends=("python-numpy" "python-pyaml" "python-matplotlib" "spglib" "python-h5py")
optdepends=("python-seekpath")
makedepends=('python-setuptools' 'python')
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('07e002da4231b37587e651fe0140fdc80199171245e0f43638bcf96cc00ef66f')



package() {
  cd "$srcdir"/phonopy-$pkgver
  python setup.py install --root "$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}