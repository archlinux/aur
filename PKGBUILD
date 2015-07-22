# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

pkgname=openvas-lib
pkgver=1.0
pkgrel=1
pkgdesc="This project is a Python library to connect and manage the latest OpenVAS servers using the OMPv4 protocol."
arch=('any')
url="http://www.golismero.com/"
license=('GPL2')
depends=('python2')
source=("https://github.com/golismero/openvas_lib/archive/${pkgver}.tar.gz")

package() {
    cd "$srcdir/openvas_lib-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
sha256sums=('3c61203e25324c3393c607764d5558cbf6fa6fed3c15ad92f901bb3a29036c65')
