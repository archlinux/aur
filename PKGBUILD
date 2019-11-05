# Maintainer: Simao Gomes Viana <xdevs23@outlook.com>

pkgname=linux-nitrous
pkgver=5.3.8
pkgrel=10
pkgdesc="Modified Linux kernel optimized for Haswell (and newer) compiled using clang"
arch=('x86_64')
url="https://gitlab.com/xdevs23/linux-nitrous"
license=('GPL2')
groups=()
depends=()
provides=('linux')
conflicts=('linux-nitrous-git')
makedepends=('tar')
source=("https://github.com/xdevs23/linux-nitrous/releases/download/v$pkgver-$pkgrel/linux-nitrous-git-$pkgver-$pkgrel-x86_64.pkg.tar.xz")
sha256sums=('208ba5dbe832ed23de76c8934ed94ea87a5863ff6f69a154a91715f140b7628c')

build() {
    echo "No need to build anything"
}

package() {
    cd "$srcdir"
    make DESTDIR="$pkgdir/" install
}
