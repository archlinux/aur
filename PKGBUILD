# Maintainer: Senderman <doletov.fyodor@yandex.ru>

pkgname=zram-s6
pkgdesc="Activate zram using skarnet's s6"
pkgver=1.2
pkgrel=1
arch=('any')
provides=('init-zram')
conflicts=('init-zram')
url="https://github.com/Senderman/s6-services"
depends=('s6')
license=('GPL3')
source=("git+${url}.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/s6-services"
    sh install.sh "zram" "${pkgdir}"
}

