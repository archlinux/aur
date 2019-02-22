# Maintainer: Conrad Sachweh <conrad+aur@spamthis.space>
# Maintainer: Arvedui <arvedui@posteo.de>
pkgname=python-feedgen
_pkgname=feedgen
pkgver=0.7.0
pkgrel=1
pkgdesc="This module can be used to generate web feeds in both ATOM and RSS format. It has support for extensions. Included is for example an extension to produce Podcasts."
url="http://lkiesow.github.io/python-feedgen"
arch=('any')
license=('BSD' 'LGPL3')
depends=('python' 'python-lxml' 'python-dateutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e431f10cef4a0ea705c176fe64290fa3')

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  python setup.py install --root="${pkgdir}/" --optimize=1
}
