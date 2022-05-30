# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-staticmap
pkgdesc='A small, python-based library for creating map images with lines and markers.'
pkgver=0.4.3
pkgrel=1
url="https://github.com/komoot/staticmap"
license=('Apache')
arch=('any')
depends=('python')
source=("https://github.com/komoot/staticmap/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('406db3e119885d928c40eccd531dbf8228d6a9eefd5687dc6c22d361ee22cb60')

package() {
  cd "${srcdir}/staticmap-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
