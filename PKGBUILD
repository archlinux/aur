# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="A modern, retro-styled terminal multiplexer inspired by Norton Disk Doctor (MS-DOS) (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('ec0f1038c2a909ee79353b1353d69d775b4c5c30c75982489d3c98f42e73c90d')
sha256sums_aarch64=('bb6046c19e2679793b9f229ca4cc3b6a033dfaebf5badca33d65c144acefd2a4')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
