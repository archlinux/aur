# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgbase=python-pydash
pkgname=('python-pydash' 'python2-pydash')
pkgver=4.7.6
pkgrel=1
pkgdesc='The kitchen sink of Python utility libraries for doing "stuff" in a functional way. Based on the Lo-Dash Javascript library.'
arch=('any')
url='https://github.com/dgilland/pydash'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('52c2efc68d8c2266606d1f700027be12f1cee77ff76f5c34c3d154b07a69ec1f')

package_python-pydash() {
  depends=('python')

  cd "pydash-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  python setup.py clean --all
}

package_python2-pydash() {
  depends=('python2')

  cd "pydash-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  python2 setup.py clean --all
}

# vim:set ts=2 sw=2 et:
