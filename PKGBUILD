# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname='clerk'
pkgver=3.2
pkgrel=2
pkgdesc="mpd client, based on rofi"
arch=('any')
url="https://github.com/carnager/clerk"
license=('MIT')
depends=('mpc' 'rofi' 'python' 'python-mpd2' 'python-notify2' 'perl')
optdepends=('mpd-sima: similar artist mode')
source=("git+https://github.com/carnager/clerk.git#tag=${pkgver}")
sha256sums=('SKIP')
install=clerk.install

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
