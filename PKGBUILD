# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>

pkgname=opticpu
pkgver=1.0
pkgrel=1
pkgdesc="A utility for optimizing CPU usage and enhancing system performance on Linux."
arch=('x86_64')
url="https://github.com/felipealfonsog/OptiCPU"
license=('GPL')
depends=('gcc' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/felipealfonsog/OptiCPU/archive/v$pkgver.tar.gz")
sha256sums=('fdf95e44bd35394c89e1244b18010894c83631f3188d55cf75de01b79266e7dc')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

