# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-phonopy')
pkgver=2.18.0
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://phonopy.github.io/phonopy"
license=('BSD')
depends=("python-numpy" "python-pyaml" "python-matplotlib" "python-spglib" "python-h5py")
optdepends=()
makedepends=('python-setuptools' 'python')
source=("https://github.com/phonopy/phonopy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e26e6a85b2df2ddf815737681a3ece75650e3beb2ca03bf5d1f705f2b33abc85')



package() {
  cd "$srcdir"/phonopy-$pkgver
  python setup.py install --root "$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}