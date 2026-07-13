# Maintainer: Sujal Vijayaraghavan

pkgname=matlock
pkgver=1.3.3
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
sha256sums=('aff11ed1362501dd0a0157a611317643c611e61daf509a6f3d36ffa5bf575869')

package() {
    cd $pkgname-${pkgver}
    make PREFIX="$pkgdir/usr" SYSCONFDIR="$pkgdir/etc" instal
}
