# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=livereload
pkgver=2.3.2
pkgrel=1
pkgdesc="Python LiveReload is an awesome tool for web developers"
arch=('any')
url="https://github.com/lepture/python-livereload"
license=('BSD')
depends=('python' 'python-tornado')
makedepends=('python-setuptools')
replaces=('python2-livereload')
source=("https://pypi.python.org/packages/source/l/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('114cb56f8c972078745dbdb22ccb815e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
