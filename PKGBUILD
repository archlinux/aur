# Maintainer: envolution
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=srsly
pkgname=python-${_pkgname}-bin
pkgver=2.5.0
pkgrel=3
pkgdesc='Modern high-performance serialization utilities for Python - bin (no cython0 req)'
arch=(x86_64)
url='https://github.com/explosion/srsly'
license=(MIT)
provides=(python-${_pkgname})
conflicts=(python-${_pkgname})
depends=(
  python-catalogue
  python-pytest
  python-pytest-timeout
  python-pytz
  python-mock
  python-numpy
)
source=("https://github.com/explosion/srsly/releases/download/release-v${pkgver}/srsly-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=('c893192da004c17c6c17a1fc0c85d4099014e0fc4d4fe711ca18a740eba87bf822d39dab902cc3748082e7a80e4a12f82828075e125f8ee5cbc991617c42e000')
noextract=("srsly-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  python -m installer --destdir="$pkgdir" "srsly-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
}
# vim:set ts=2 sw=2 et:
