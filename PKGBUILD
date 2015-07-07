# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=python-tunigo
_pypiname=tunigo
pkgver=0.1.3
pkgrel=1
pkgdesc="Python API for the browse feature of Spotify"
arch=('any')
url="https://github.com/trygveaa/python-tunigo"
license=('APACHE')
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/t/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('a8724b6964d76782cb7156a8b713fdce')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
