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
sha256sums=("d519c7e0724627fae513219e43c8b7acecd70728667fc2ee2450ede119a0c8d0")

package() {
    install -Dm755 ambit -t "$pkgdir/usr/bin/"
}
