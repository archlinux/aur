# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-dpkt
_pkgname=dpkt
pkgver=1.8.6.2
pkgrel=2
pkgdesc="This is a Python library for interacting with and creating packets."
arch=('i686' 'x86_64')
url="https://github.com/kbandla/dpkt"
license=('custom')
depends=('python2')
source=("https://pypi.python.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('ada8a7477f67ffa0cf4042e6138a6fed')

package() {
  cd "${srcdir}/dpkt-${pkgver}"
  python2 setup.py build install --root="${pkgdir}"
}

