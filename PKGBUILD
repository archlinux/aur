# Maintainer:  Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

pkgname=python-pulsectl-asyncio
_srcname=pulsectl-asyncio
pkgver=0.2.3
pkgrel=1
pkgdesc="Asyncio frontend for pulsectl, a Python bindings library for PulseAudio (libpulse)"
arch=('x86_64')
url="https://github.com/mhthies/pulsectl-asyncio"
license=('MIT')
depends=('python>=3.6' 'python-pulsectl>=1:21.10.2')
makedepends=('python-setuptools')
source=("https://github.com/mhthies/pulsectl-asyncio/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d4a35e24d3a0e6ebc09f54de6129e61fee93e886bca30342555714003da35000')

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 ft=sh et:
