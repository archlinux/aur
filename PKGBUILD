# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=scratch3-bin
pkgver=3.21.0
pkgrel=1
pkgdesc="Create and share your own interactive stories, games, and animations with others"
arch=('x86_64')
url="https://github.com/LLK/scratch-desktop"
license=('BSD-3-Clause')
conflicts=('scratch3')
provides=('scratch3')
depends=('electron11')
source=('https://aya1.xyz/https://github.com/Brx86/yun/releases/download/2/scratch3-bin.tar.zst')
md5sums=('01aa01a704b7376d1de079c9d543320d')

prepare() {
    mkdir "$pkgname-$pkgver"
    cp -r usr "$pkgname-$pkgver"/usr
}

package() {
    cd "$pkgname-$pkgver"
    cp -r usr ${pkgdir}
}
