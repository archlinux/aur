_pkgname=aiohttp-jinja2
pkgname="python-${_pkgname}"
pkgver=1.5.1
pkgrel=1
pkgdesc="jinja2 template renderer for aiohttp.web"
url="https://github.com/aio-libs/aiohttp_jinja2/"
arch=('any')
license=('APACHE 2')
depends=('python' 'python-aiohttp' 'python-jinja')
makedepends=('python' 'python-setuptools')
source=(https://github.com/aio-libs/${_pkgname}/archive/v${pkgver}.zip)

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('a229eff04e9cd49deca30007cc6d58e3')
