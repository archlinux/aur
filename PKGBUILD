# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-phonopy')
pkgver=2.21.0
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://github.com/phonopy/phonopy"
license=('BSD')
depends=("python-numpy" "python-pyaml" "python-matplotlib" "spglib" "python-h5py")
optdepends=("python-seekpath")
makedepends=('python-setuptools' 'python')
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('82402a4a796d06eb298a536356021e008ce99bc1f667bee43e52f0b2917aa639')



package() {
  cd "$srcdir"/phonopy-$pkgver
  python setup.py install --root "$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}