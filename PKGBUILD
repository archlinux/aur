# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=ripser
pkgname=python-$_modulename
pkgver=0.4.1
pkgrel=2
pkgdesc="A Lean Persistent Homology Library for Python"
arch=(any)
url="https://github.com/scikit-tda/ripser.py"
license=('MIT')
groups=()
depends=('python' 'cython' 'python-numpy' 'python-scipy' 'python-scikit-learn' 'python-persim')
makedepends=('python-setuptools' 'cython')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ec7f34935f5e6d3430c7f5a27007ccf4f50a21936d4045c0d3aa1e77209ef8fa')
package() {
  cd "$srcdir/${_modulename}.py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
