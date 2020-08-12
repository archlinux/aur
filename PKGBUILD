pkgname=status
pkgver=4
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
sha256sums=('b7eda2d4af5c0262aa7ffc12257099cc51cd9948804dedc6c24c383850a552d4')
