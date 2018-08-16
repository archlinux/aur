# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Dennis Fink <the_metalgamer@hackerspace.lu>

_pkgname=translitcodec
pkgbase=python2-${_pkgname}
pkgname=("python2-${_pkgname}" "python-${_pkgname}")
pkgver=0.4
pkgrel=2
pkgdesc="Unicode to 8-bit charset transliteration codec"
depends=('python2')
makedepends=('python2-setuptools' 'python-setuptools')
arch=('any')
url="https://github.com/claudep/${_pkgname}"
license=('MIT')
source=("${url}/archive/version-${pkgver}.tar.gz")
sha256sums=('672858880f6b53a668cc70ef53499c2a226958c6484ed6b5f50b7be527670bca')

package_python2-translitcodec() {
  cd "${srcdir}/${_pkgname}-version-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

package_python-translitcodec() {
  depends=('python')
  cd "${srcdir}/${_pkgname}-version-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
