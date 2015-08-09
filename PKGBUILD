# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=livereload
pkgver=2.4.0
pkgrel=1
pkgdesc="Python LiveReload is an awesome tool for web developers"
arch=('any')
url="https://github.com/lepture/python-livereload"
license=('BSD')
depends=('python' 'python-six' 'python-tornado')
makedepends=('python-setuptools')
source=("https://github.com/lepture/python-livereload/archive/v${pkgver}.tar.gz")
md5sums=('2ffeb87a910c22c5913b7962b093e5c8')

package() {
  cd "${srcdir}/python-livereload-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
