# Maintainer: Carlos Eduardo Moreira dos Santos <cems (at) cemshost DOT com (dot) br>
pkgname=yala
pkgver=1.0.1
pkgrel=1
pkgdesc="Combine Python linters in a sane way"
arch=('any')
url="https://github.com/cemsbr/yala"
license=('MIT')
groups=()
depends=('pydocstyle' 'python-pycodestyle' 'python-pyflakes' 'python-pylint'
	 'python-radon')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://pypi.python.org/packages/96/2f/821fec29b1d1b3e0a1f599d126e15d5e0f1f1a418386173c2df9d068fe4b/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('54666b00ed8c488cc74b1f1260923f57e8a8521452c46de9df0f64103a100db8')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
