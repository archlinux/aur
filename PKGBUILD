pkgname=status
pkgver=6
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
sha256sums=('431adedcea47f52698b85d8fdc2cc3a19d1d618949b544cccaa5800d3162685c')
