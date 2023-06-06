pkgname="exoplanet-git"
_pkgname="exoplanet"
pkgver=0.5.3
pkgrel=1
pkgdesc="Fast & scalable MCMC for all your exoplanet needs! "
arch=("x86_64")
url='https://github.com/exoplanet-dev/exoplanet'
license=('MIT')
makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/exoplanet-dev/exoplanet.git")
sha256sums=('SKIP')


package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root=$pkgdir
}

