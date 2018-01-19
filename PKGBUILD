# Maintainer: Joffrey Darcq <j-off@live.fr>

pkgname='seafile-helper'
pkgver=0.1
pkgrel=1
pkgdesc='Seafile-server and seahub helper for upgrade and deployment'
arch=('any')
url="https://github.com/jojotango/${pkgname}"
license=('GPL3')
depends=('python-setuptools' 'seafile-server' 'seahub')
source=("https://github.com/jojotango/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('84d6f1abc647f5f92b1fd3aca6e3977d3aa86669f6b8332f92054171f60d3c32')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    python setup.py install --root="$pkgdir" --optimize=1
}
