# Maintainer: Joffrey Darcq <j-off@live.fr>

pkgname='seafile-helper'
pkgver=0.1.2
pkgrel=1
pkgdesc='Seafile-server and seahub helper for upgrade and deployment'
arch=('any')
url="https://github.com/jojotango/${pkgname}"
license=('GPL3')
depends=('python-setuptools' 'seahub')
source=("https://github.com/jojotango/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2d796a4b432eff182bfe2ff64ceda8b9167b5b8ad5650f1e05d372756ac36225')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    python setup.py install --root="${pkgdir}" --optimize=1
}
