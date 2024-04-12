# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=sts
pkgver=3.2.7
pkgrel=2
pkgdesc="Improved version of the NIST Statistical Test Suite (STS)"
url=https://github.com/arcetri/sts
arch=(x86_64)
license=(Unlicense)
depends=(fftw)
source=(https://github.com/arcetri/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=(bfe676ba5cf83c64ed7ccb8de40540a94f41882ef3d77f57edc82129fc62bbe1de6c9ac429dc9c9aa144eddcb100af47e5e5b8102825cf86a3f084d24a7051b4)

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTBINDIR="${pkgdir}"/usr/bin install
}
