# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=crabz-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Like pigz, but in Rust"
arch=('x86_64')
url="https://github.com/sstadick/crabz"
license=('MIT')
provides=('crabz')
conflicts=('crabz')
source=("crabz-${pkgver}::${url}/releases/download/v${pkgver}/crabz-linux-amd64")
sha256sums=('d89938d5e8b7d7c1fa71cfd68885d4fd1a1effb3d901b55512c460d0341394a6')

package() {
    install -D -m755 "crabz-$pkgver" "$pkgdir/usr/bin/crabz"
}

