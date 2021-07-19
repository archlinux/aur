# Maintainer:  Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

pkgname=python-pulsectl-asyncio
_srcname=pulsectl-asyncio
pkgver=0.1.7
pkgrel=1
pkgdesc="Asyncio frontend for pulsectl, a Python bindings library for PulseAudio (libpulse)"
arch=('x86_64')
url="https://github.com/mhthies/pulsectl-asyncio"
license=('MIT')
depends=('python>=3.6' 'python-pulsectl>=1:21.5.18')
makedepends=('python-setuptools')
source=("https://github.com/mhthies/pulsectl-asyncio/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('158720f521bc85178705f6614903dbdb0769d493')

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 ft=sh et:
