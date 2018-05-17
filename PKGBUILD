# Maintainer: Conrad Sachweh <conrad+aur@spamthis.space>
pkgname=python2-feedgen
_pkgname=feedgen
pkgver=0.6.1
pkgrel=1
pkgdesc="This module can be used to generate web feeds in both ATOM and RSS format. It has support for extensions. Included is for example an extension to produce Podcasts."
url="http://lkiesow.github.io/python-feedgen"
arch=('any')
license=('BSD' 'GPL')
depends=('python2' 'python2-lxml' 'python2-dateutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('0356a7500222b7cb283fa02a5960a19b')

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
