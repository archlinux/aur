# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=crabz-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Like pigz, but in Rust"
arch=('x86_64')
url="https://github.com/sstadick/crabz"
license=('MIT')
provides=('crabz')
conflicts=('crabz')
source=("crabz-${pkgver}::${url}/releases/download/v${pkgver}/crabz-linux-amd64")
sha256sums=('01fa3e853a20109130180ee7d4e1bff047f0c710bbfa4de7a0904bf49af4886c')

package() {
    install -D -m755 "crabz-$pkgver" "$pkgdir/usr/bin/crabz"
}
