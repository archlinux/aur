# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=uchroma
pkgver=1.0.1
pkgrel=1
pkgdesc="An advanced driver for Razer Chroma hardware in Linux"
arch=('x86_64' 'i686')
url="https://github.com/cyanogen/uchroma"
license=('LGPL3')
depends=('python' 'python-wrapt' 'python-traitlets' 'python-ruamel-yaml' 'python-scikit-image' 'python-pydbus' 'python-hsluv' 'python-hidapi-cffi' 'python-frozendict' 'python-colorlog' 'python-argcomplete' 'python-grapefruit' 'python-cffi' 'hidapi' 'python-evdev' 'python-pyudev' 'python-hidapi' 'python-gbulb' 'python-colr' 'python-dask')
makedepends=('cython' 'python-pytest-runner')
provides=()
conflicts=()
options=(!emptydirs)
install=$pkgname.install
source=("https://github.com/cyanogen/uchroma/archive/release/$pkgver.tar.gz")
sha512sums=('a9022f181270ca1cff39dbf5f7c09e17693ef2c144bba29778d13e187be32ab20d8613ce0419e9c992a5f2ffb84b9ba46f865bdb6a6ebc2da94b292b0fb81afe')

package() {
  cd "$srcdir/$pkgname-release-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
