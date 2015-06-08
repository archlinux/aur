# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: kang <kang@insecure.ws>

_pkgname=sphinxcontrib-newsfeed
pkgname=python-${_pkgname}
pkgver=0.1.4
pkgrel=1
pkgdesc="News Feed extension for Sphinx"
arch=('i686' 'x86_64')
url="https://bitbucket.org/prometheus/sphinxcontrib-newsfeed"
license=('BSD')
depends=('python-sphinx')
source=("https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('96d9d0c15fca8b62f945bafc8f0eafa62df9c471f7510e2f153e47b66534e5f3041e5c01df772e6c35a9f09baa70064642f7f0fa43ccfd33dd64c2604494f2fc')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
