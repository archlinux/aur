pkgname=python-m-loop
_pkgname=M-LOOP
pkgver=3.3.1
pkgrel=2
pkgdesc='Rapidly optimize the parameters of a scientific experiment or computer controller system'
arch=('any')
url='https://github.com/michaelhush/M-LOOP/'
license=('MIT')
depends=('python' 'python-setuptools' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-tensorflow' 'python-scikit-learn' 'python-pytest')
#source=("https://github.com/michaelhush/M-LOOP/archive/refs/tags/v$pkgver.tar.gz")
source=("https://github.com/zakv/M-LOOP/archive/refs/heads/157-numpy-float-deprecated.zip")
#sha256sums=('4a81ad691ffb7b97b08296489430caeffc36ab64a7ac3e3708caaab20cbd130a')
sha256sums=('2b9bb11e0c8adfb0500cc9175ff16871915a59f57ef07839cc3dc83639999d16')

build() {
#  cd "$_pkgname-$pkgver"
  cd "$_pkgname-157-numpy-float-deprecated"

  python setup.py build
}

package() {
#  cd "$_pkgname-$pkgver"
  cd "$_pkgname-157-numpy-float-deprecated"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
}
