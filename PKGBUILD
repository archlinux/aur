# Maintainer:  Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

pkgname=python-pulsectl-asyncio
_srcname=pulsectl-asyncio
pkgver=0.2.0
pkgrel=1
pkgdesc="Asyncio frontend for pulsectl, a Python bindings library for PulseAudio (libpulse)"
arch=('x86_64')
url="https://github.com/mhthies/pulsectl-asyncio"
license=('MIT')
depends=('python>=3.6' 'python-pulsectl>=1:21.10.2')
makedepends=('python-setuptools')
source=("https://github.com/mhthies/pulsectl-asyncio/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('0e33f1c47b51c7e26ef55b10fb142d58892719ab')

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 ft=sh et:
