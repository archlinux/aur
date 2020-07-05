pkgname=status
pkgver=1
pkgrel=1
pkgdesc='Simple status thing for using with i3'
url='https://github.com/sandsmark/status'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=(gcc)
depends=('libpulse')
source=("https://github.com/sandsmark/status/archive/${pkgver}.tar.gz")
sha256sums=('496d996053193984f44bc8d183afa17422abf10d7a83da8dba819564fb835c72')

build() {
    cd status-${pkgver}
    make
}

package() {
    cd status-${pkgver}
    install -D -m755 status -t "${pkgdir}/usr/bin"
}
