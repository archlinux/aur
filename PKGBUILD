# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=fgivenx
pkgname=python-$_modulename
pkgver=1.1.0
pkgrel=2
pkgdesc="Functional Posterior Plotter"
arch=(any)
url="https://github.com/williamjameshandley/fgivenx"
license=('MIT')
groups=()
depends=('python-numpy' 'python-matplotlib' 'python-scipy' 'python-joblib' 'python-mpi4py' 'python-tqdm')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('8dbf495997300e52e8c20958d71d1f2fd69cd457ebfea108b10e8770dd6048d6')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
