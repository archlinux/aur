# Maintainer: Conrad Sachweh <conrad+aur@spamthis.space>
pkgname=python2-feedgen
_pkgname=feedgen
pkgver=0.8.0
pkgrel=1
pkgdesc="This module can be used to generate web feeds in both ATOM and RSS format. It has support for extensions. Included is for example an extension to produce Podcasts."
url="http://lkiesow.github.io/python-feedgen"
arch=('any')
license=('BSD' 'GPL')
depends=('python2' 'python2-lxml' 'python2-dateutil')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('26557304284007a3c2d772c376a48c0a8ec8e24371c4471455ea89cf568fa114')

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
