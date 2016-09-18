# Maintainer: renek <aur@spaceshore.net>
_pkgname=multidict
pkgname=python-${_pkgname}
pkgver=2.1.0
pkgrel=1
pkgdesc="A multidict implementation"
arch=('any')
url='https://github.com/aio-libs/multidict'
license=('APACHE')
depends=('python')
makedepends=('cython' 'python-setuptools')
source=("https://github.com/aio-libs/multidict/archive/v${pkgver}.tar.gz")
sha512sums=('124691f3654b202cc35c59bf4e1c38a9da7d89ca3fed71f800d15313fb4042b55c0df25c012be72b0cf64ca1b8cc00707f001d007df649840e0d7a76d171d385')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
