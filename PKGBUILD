# Maintainer: Conrad Sachweh <conrad+aur@spamthis.space>
pkgname=python2-feedgen
_pkgname=feedgen
pkgver=0.7.0
pkgrel=1
pkgdesc="This module can be used to generate web feeds in both ATOM and RSS format. It has support for extensions. Included is for example an extension to produce Podcasts."
url="http://lkiesow.github.io/python-feedgen"
arch=('any')
license=('BSD' 'GPL')
depends=('python2' 'python2-lxml' 'python2-dateutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('82c9e29884e137c3e3e7959a02f142d1f7a46cd387d572e9e40150112a27604f')

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
