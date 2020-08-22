pkgname=status
pkgver=5
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
sha256sums=('a1a5ee3d92c861b5b2192389da1a27c4ee1cf78e172a9caf09f34e2ff2c5d1fe')
