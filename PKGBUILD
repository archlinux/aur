# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Adrian Petrescu <apetresc@gmail.com>

pkgname='clerk-legacy'
pkgver=3.2.1
pkgrel=2
pkgdesc="mpd client, based on rofi"
arch=('any')
url="https://github.com/carnager/clerk"
license=('MIT')
depends=('mpc' 'rofi' 'python' 'python-mpd2' 'python-notify2' 'perl')
optdepends=('mpd-sima: similar artist mode')
provides=('clerk')
conflicts=('clerk-git')
replaces=('clerk')
source=("https://github.com/carnager/clerk/archive/${pkgver}.tar.gz")
sha256sums=('954a388cce5a86c1760e130febc59b533651a01938b0c9a6b1f4941dda83db97')
install=clerk.install

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
