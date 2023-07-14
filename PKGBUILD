# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-phonopy')
pkgver=2.20.0
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://phonopy.github.io/phonopy"
license=('BSD')
depends=("python-numpy" "python-pyaml" "python-matplotlib" "python-spglib" "python-h5py")
optdepends=()
makedepends=('python-setuptools' 'python')
source=("https://github.com/phonopy/phonopy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1dd47cb6e5b427d5cb88ce0b810b91f05533f434d53d22ea69eb974d4eb0ab46')



package() {
  cd "$srcdir"/phonopy-$pkgver
  python setup.py install --root "$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}