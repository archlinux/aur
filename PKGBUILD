# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-rcssmin"
pkgname="${_pkgname}"
pkgver=1.0.6
pkgrel=1
pkgdesc="rCSSmin is a CSS minifier written in python."
arch=('i686' 'x86_64')
url="https://github.com/ndparker/rcssmin"
license=('APACHE')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://github.com/ndparker/rcssmin/archive/${pkgver}.tar.gz)
md5sums=('50317e853aa273a963e9b406d5743528')

package() {
  cd "${srcdir}/rcssmin-${pkgver}"

  python setup.py install --root="$pkgdir" --prefix=/usr
}
