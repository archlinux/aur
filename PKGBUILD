# Maintainer: Victor Lavaud <victor.lavaud@gmail.com>
pkgname=sprog-fortune-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A fortune database made of /u/poem_for_your_sprog's comments in Reddit"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/qdii/sprog-fortune"
license=('GPL')
depends=()
makedepends=()
provides=('sprog-fortune-bin')
conflicts=('sprog-fortune-bin')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('SKIP')

package() {
    cd "${pkgname%-bin}-${pkgver}"
    install -Dm444 sprog "$pkgdir/usr/share/fortune/sprog"
    install -Dm444 sprog.dat "$pkgdir/usr/share/fortune/sprog.dat"
}
