# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=uchroma
pkgver=1.0.3
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
sha512sums=('178ba66f4e6f2a2d93a7120026010e68d1a5b518ed309f1ad6f5014ba8a699ba9f432b2fa3146f0d06842fc0b5a7c57f727406b506a5e12009793f785d71e230')

package() {
  cd "$srcdir/$pkgname-release-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
