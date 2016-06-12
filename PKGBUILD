# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-pyphen"
pkgname="${_pkgname}"
pkgver=0.9.4
pkgrel=1
pkgdesc="Pyphen is a pure Python module to hyphenate text using existing Hunspell hyphenation dictionaries."
arch=('any')
url="http://pyphen.org/"
license=('GPL2' 'LGPL2.1' 'MPL')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://github.com/Kozea/Pyphen/archive/${pkgver}.tar.gz)
md5sums=('5b27217dde553bc0fdd3f7d3878e85a4')

package() {
  cd "${srcdir}/Pyphen-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr
}
