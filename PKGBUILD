# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-speedtest-cli
_pkgname=speedtest-cli
pkgver=0.3.2
pkgrel=1
pkgdesc='Command line interface for testing internet bandwidth using speedtest.net'
license=('BSD')
arch=('x86_64' 'i686')
url='https://github.com/sivel/speedtest-cli'
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('ea8cc64b0971f5d852354a2862fe896736432d3ab5b1139251fbc6beb6a5db3fc90e7cde8084f66a8dc622c4e47e2207c828e8868448367245576e4b3d40b38f')

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
