# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-rcssmin"
pkgname="${_pkgname}"
pkgver=1.0.4
pkgrel=1
pkgdesc="rCSSmin is a CSS minifier written in python."
arch=('i686' 'x86_64')
url="http://opensource.perlig.de/rcssmin/"
license=('APACHE')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(http://storage.perlig.de/rcssmin/rcssmin-${pkgver}.tar.gz)
md5sums=('2edb39c9178c7a275a639f8152e5d55c')

package() {
  cd "${srcdir}/rcssmin-${pkgver}"

  python setup.py install --root="$pkgdir" --prefix=/usr
}
