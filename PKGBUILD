# Maintainer: Ykkzde <dmitry@ykkz.de>

pkgname=random-case-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple fetch script for pacman based distros. Written in Rust."
url="https://gitlab.com/ykkzde/random-case"
license=('GPL3')
provides=('random-case')
conflicts=('random-case-git')
depends=(
    gcc-libs
)

source=("random-case-$pkgver::https://github.com/ykkzde/random-case/releases/download/v$pkgver/random-case-v$pkgver-linux-x64")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('92fe37003d90b2bae473ecbc6b56543ccf541dfcb3222e72cf99e68c36f7c13a82d0b70e399bda0da08ea8e81b73fe9e0b8fdb9eaed76f7fef5b472e9e85154a')

arch=('x86_64')

package() {
    install -D "$srcdir/random-case-$pkgver" "$pkgdir/usr/bin/random-case"
}
