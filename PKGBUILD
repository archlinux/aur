# Maintainer: Amish <contact at via dot aur>
# Contributor: ArthurBorsboom <arthurborsboom@gmail.com>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: markelos <axilleas@archlinux.gr>
# Contributor: helios <aur@wiresphere.de>
pkgname=spark
pkgver=2.8.3
pkgrel=2
pkgdesc="Cross-platform real-time collaboration client optimized for business and organizations."
arch=('any')
url="http://www.igniterealtime.org/projects/spark/"
license=('LGPL')
depends=('java-runtime' 'unixodbc' 'libxtst')
options=('!strip')
source=(http://download.igniterealtime.org/${pkgname}/${pkgname}_${pkgver//./_}.deb)
md5sums=('12335bc5cbf223f128e44da44b620942')
conflicts=('spark-svn')

package() {
    cd "${srcdir}"
    msg2 "Extracting the data.tar.xz..."
    bsdtar -C "${pkgdir}" -xf data.tar.xz
}
