# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=("python2-cliff-kilo")
pkgver="1.10.1"
pkgrel="1"
pkgdesc="Command Line Interface Formulation Framework"
arch=("any")
url="https://github.com/openstack/cliff"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/c/cliff/cliff-${pkgver}.tar.gz")
sha256sums=('ddfec39bf0de7b53666045c946d495ca070e538e5f92dc19588596c9bcc52c6e')

package() {
    depends=("python2-cmd2>=0.6.7"
             "python2-prettytable>=0.7"
             "python2-pyparsing>=2.0.1"
             "python2-six>=1.9.0"
             "python2-stevedore-kilo")
    cd "${srcdir}/cliff-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
