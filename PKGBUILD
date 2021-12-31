# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=fgivenx
pkgname=python-$_modulename
pkgver=2.4.0
pkgrel=1
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
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a42586754a0af5520d34eb8343ce8453996f9d0e391028268a3d2bf4347fd685')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
