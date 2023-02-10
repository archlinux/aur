pkgname=python-m-loop
_pkgname=m-loop
pkgver=3.3.1
pkgrel=1
pkgdesc='Rapidly optimize the parameters of a scientific experiment or computer controller system'
arch=('any')
url='https://github.com/michaelhush/M-LOOP/'
license=('MIT')
depends=('python' 'python-setuptools' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-tensorflow' 'python-scikit-learn' 'python-pytest')
source=("https://github.com/michaelhush/M-LOOP/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a81ad691ffb7b97b08296489430caeffc36ab64a7ac3e3708caaab20cbd130a')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-buil
}
