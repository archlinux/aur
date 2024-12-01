# Maintainer: envolution
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=srsly
pkgname=python-${_pkgname}-bin
pkgver=2.4.8
pkgrel=2
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
source=("https://files.pythonhosted.org/packages/a1/1d/c4b28e95d9ec4c2e7dad201fa415a483e173fcce444d52dd53be0b0469f3/srsly-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=('3d4c3dd69756c02f0ea575941e3f16f580a6cf2b37bde7e2c8375dc8a69e174b1ebe08582894210d875f0a6bc9a5a3d02045062bde23e8d89fe1dbdcd7087b6d')
noextract=("srsly-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  python -m installer --destdir="$pkgdir" "srsly-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
}
# vim:set ts=2 sw=2 et:
