pkgname=status
pkgver=7
pkgrel=1
pkgdesc='Simple status thing for using with i3'
url='https://github.com/sandsmark/status'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('gcc')
depends=('libpulse' 'systemd')
source=("https://github.com/sandsmark/status/archive/${pkgver}.tar.gz")

build() {
    cd status-${pkgver}
    make
}

package() {
    cd status-${pkgver}
    install -D -m755 status -t "${pkgdir}/usr/bin"
}
md5sums=('0d8a55d031d8ba6539c1e875188b668a')
