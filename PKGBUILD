# Contributor: Cyberpunk <apocalipsisfull-2011@outlook.com>
# Maintainer: Cyberpunk <apocalipsisfull-2011@outlook.com>

pkgname=openvas-lib
pkgver=0.1.0
pkgrel=1
pkgdesc="This project is a Python library to connect and manage the latest OpenVAS servers using the OMPv4 protocol."
arch=('any')
url="http://www.golismero.com/"
license=('GPL2')
depends=('python2')
source=('https://github.com/golismero/openvas_lib/archive/master.zip')

package() {
    cd "$srcdir/openvas_lib-master"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('d6f2eb580fdb01a8334e38044eab8036074310a2b89a0d4760b94eda115416b1')
