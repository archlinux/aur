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
source=("https://github.com/lepture/python-livereload/archive/v${pkgver}.tar.gz")
md5sums=('348ed9aafc41d02c78bb1298725d3aa9')

package() {
  cd "${srcdir}/python-livereload-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
