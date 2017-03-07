# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=uchroma
pkgver=1.0
pkgrel=1
pkgdesc="An advanced driver for Razer Chroma hardware in Linux"
arch=('any')
url="https://github.com/cyanogen/uchroma"
license=('GPL')
depends=('python' 'python-wrapt' 'python-traitlets' 'python-ruamel-yaml' 'python-scikit-image' 'python-pydbus' 'python-hsluv' 'python-hidapi-cffi' 'python-frozendict' 'python-colorlog' 'python-argcomplete' 'python-grapefruit' 'python-cffi' 'hidapi' 'python-evdev' 'python-pyudev' 'python-hidapi' 'python-gbulb' 'python-colr' 'python-dask')
makedepends=('cython' 'python-pytest-runner')
provides=()
conflicts=()
options=(!emptydirs)
install=$pkgname.install
source=("https://github.com/cyanogen/uchroma/archive/release/$pkgver.tar.gz")
sha512sums=('cdf295c9e0eb666ef89a6531c96c9bb96c3970b7f153204fba38b988ddb203f1ee3a88f964e21d62927f1ad8f93cbfacaf7094226683917a1d5508707c4a4a00')

package() {
  cd "$srcdir/$pkgname-release-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
