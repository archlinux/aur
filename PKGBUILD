# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-rcssmin"
pkgname="${_pkgname}"
pkgver=1.0.5
pkgrel=1
pkgdesc="rCSSmin is a CSS minifier written in python."
arch=('i686' 'x86_64')
url="https://github.com/ndparker/rcssmin"
license=('APACHE')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://github.com/ndparker/rcssmin/archive/${pkgver}.tar.gz)
md5sums=('fac36129c42a132c8cf08f879e97e96f')

package() {
  cd "${srcdir}/rcssmin-${pkgver}"

  python setup.py install --root="$pkgdir" --prefix=/usr
}
