# Maintainer: Joffrey Darcq <j-off@live.fr>

pkgname='seafile-helper'
pkgver=0.1.1
pkgrel=1
pkgdesc='Seafile-server and seahub helper for upgrade and deployment'
arch=('any')
url="https://github.com/jojotango/${pkgname}"
license=('GPL3')
depends=('python-setuptools' 'seafile-server' 'seahub')
source=("https://github.com/jojotango/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('481b556a8e030ae911baeedae5c67388e25d3401199adb33d5259cdf0123bf74')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    python setup.py install --root="$pkgdir" --optimize=1
}
