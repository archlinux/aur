# Maintainer: Constantin Schomburg <me@xconstruct.net>

pkgname=mcpatcher
pkgver='2.2.0'
pkgrel=1
pkgdesc="Minecraft patcher to fix textures with higher than default resolution"
arch=('any')
license=('Public Domain')
url="https://github.com/pclewis/mcpatcher"
depends=('java-runtime')
optdepends=('minecraft: the game itself')
source=(mcpatcher
        https://github.com/downloads/pclewis/mcpatcher/mcpatcher-$pkgver.jar)
md5sums=('38358254be76dc84676509f43be44938'
         '97bd5a1af8fc8785fbb2ffa56e1e0678')

build() {
    cd "$srcdir"

    install -vDm755 "mcpatcher"             "$pkgdir/usr/bin/mcpatcher"
    install -vDm644 "mcpatcher-$pkgver.jar" "$pkgdir/usr/share/mcpatcher/mcpatcher.jar"
}

# vim:set ts=4 sw=4 et:
