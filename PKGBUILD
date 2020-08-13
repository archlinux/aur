# Contributor : Repentinus <arch at repentinus dot eu>
# Contributor : Simon Doppler <dop dot simon at gmail dot com>

_pkgname=simplekml
pkgname=python-simplekml
pkgver=1.3.5
pkgrel=1
pkgdesc="KML generation helpers"
arch=('any')
url="https://simplekml.readthedocs.io/en/latest/"
license=('LGPL3')
depends=('python')
source=("https://files.pythonhosted.org/packages/62/de/a75c0c8341a2edd186e14648c231c92c9e672dd38c544089615140c28ac6/simplekml-${pkgver}.tar.gz")
sha256sums=('657b4e20177299a4e80bacfafff1f91102010bc23dc0ce7a7ae43bdd4246049e')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir"
}
