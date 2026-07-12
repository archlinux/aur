# Maintainer: Sujal Vijayaraghavan

pkgname=matlock
pkgver=1.3.1
pkgrel=0
pkgdesc='Screen lock program for X and Wayland like in The Matrix (1999)'
arch=('x86_64' 'aarch64')
url="https://github.com/sujaltv/matlock"
license=('MIT')
depends=('libx11' 'libxext' 'libxrandr' 'libxcrypt' 'wayland' 'libxkbcommon'
    'freetype2' 'fontconfig')
makedepends=('make' 'git' 'wayland-protocols')
backup=('etc/matlock.yaml')
source=("https://github.com/sujaltv/matlock/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('95c95d83add224a86bd83e7cda06a28d598ab7fb0b9bee0bccfe32846061e8b7')

package() {
    cd $pkgname-${pkgver}
    make PREFIX="$pkgdir/usr" SYSCONFDIR="$pkgdir/etc" instal
}
