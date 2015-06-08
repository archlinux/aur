# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

_pkgname=sphinxcontrib-newsfeed
pkgname=python2-${_pkgname}
pkgver=0.1.4
pkgrel=1
pkgdesc="News Feed extension for Sphinx"
arch=('i686' 'x86_64')
url="https://bitbucket.org/prometheus/sphinxcontrib-newsfeed"
license=('BSD')
depends=('python2-sphinx')
source=("https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f78c865b1a32d249644a9c46f395b547df0dc21ed69b70898d64235b4755efb4')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
