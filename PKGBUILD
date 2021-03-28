# Maintainer: Edward Wibowo <wibow9770@gmail.com>
# Maintainer: Vir Chaudhury <virchau13@mail.hexular.net>
pkgname=ambit-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Dotfile manager written in Rust."
url="https://github.com/plamorg/ambit"
license=("GPL-3.0")
arch=("x86_64")
provides=("ambit")
options=("strip")
source=("https://github.com/plamorg/ambit/releases/download/v$pkgver/ambit-$pkgver-x86_64.tar.gz")
sha256sums=("497657eb4a92617283c7538a5b3390b0777006f835d2699d0fe835ef5618114a")

package() {
    install -Dm755 ambit -t "$pkgdir/usr/bin/"
}
