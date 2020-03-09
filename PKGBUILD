# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nc-vsock
pkgver=1.0.1
pkgrel=1
pkgdesc="netcat-like utility for AF_VSOCK"
arch=('x86_64')
url="https://github.com/stefanha/nc-vsock"
license=('GPL')
depends=('glibc')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    install -D -m755 nc-vsock -t "${pkgdir}/usr/bin/"
}

sha256sums=('8abfd19a51e4482febd3a684054097bfdcd9dda024f93b07708515f746973b71')
