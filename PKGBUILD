# Maintainer: Constantin Schomburg <me at xconstruct dot net>

pkgname=mcpatcher
pkgver='1.1.9_01'
pkgrel=1
pkgdesc="Minecraft patcher to fix textures with higher than default resolution"
arch=('any')
license=('custom')
url="https://github.com/pclewis/mcpatcher"
depends=('java-runtime')
optdepends=('minecraft: the game itself')
source=(mcpatcher https://github.com/downloads/pclewis/mcpatcher/mcpatcher-$pkgver.jar)
md5sums=('38358254be76dc84676509f43be44938'
         '60bff9e61c7db96c1cae3bc51ba713a3')

build() {
    cd "$srcdir" || return 1

    mkdir -p $pkgdir/usr/bin
    cp mcpatcher $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/mcpatcher
    cp mcpatcher-$pkgver.jar $pkgdir/usr/share/mcpatcher/mcpatcher.jar
}

# vim:set ts=4 sw=4 et:
