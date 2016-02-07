# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgbase=python2-tunigo
pkgname=('python-tunigo' 'python2-tunigo')
pkgver=1.0.0
pkgrel=1
pkgdesc="Python API for the browse feature of Spotify"
arch=('any')
url="https://github.com/trygveaa/python-tunigo"
license=('APACHE')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://github.com/trygveaa/python-tunigo/archive/v${pkgver}.tar.gz")
md5sums=('8b7cc6c78e91d4aff7674f25fbb8e19c')

package_python-tunigo() {
  depends=('python' 'python-requests')

  cd "${srcdir}/python-tunigo-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-tunigo() {
  depends=('python2' 'python2-requests')

  cd "${srcdir}/python-tunigo-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
