# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch
pkgver=1.0.5.1
pkgrel=1
pkgdesc="Simple fetch script for pacman based distros. Written in Rust."
url="https://git.auteiy.me/dmitry/pacFetch"
license=('GPL3')
depends=(
    gcc-libs
)

source=("pacfetch-v$pkgver::https://github.com/auteiy/pacfetch/releases/download/v$pkgver/pacfetch-v$pkgver-linux-x64")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('85edcb0bb759481cc7ab2fa34053ecc2c16980b6186d9ae73c11a07f13bf57a34714051509f651737e9c1d7bcc3a924806a450228b554c5dfd63cd1bef9af41d')

arch=('x86_64')

package() {
    install -D "$srcdir/pacfetch-v$pkgver" "$pkgdir/usr/bin/pacfetch"
}
