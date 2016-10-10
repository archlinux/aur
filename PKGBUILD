# Maintainer: renek <aur@spaceshore.net>
_pkgname=multidict
pkgname=python-${_pkgname}
pkgver=2.1.2
pkgrel=1
pkgdesc="A multidict implementation"
arch=('any')
url='https://github.com/aio-libs/multidict'
license=('APACHE')
depends=('python')
makedepends=('cython' 'python-setuptools')
source=("https://github.com/aio-libs/multidict/archive/v${pkgver}.tar.gz")
sha512sums=('7debfe3c0abb3323a5ee82b7522ab86162b3d44333ea7dcb26c7c87d24fb4c4c062095db9603ac4a757d507971fff6252f4b3dd9d2183ea167caa5ae80ae3b33')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
