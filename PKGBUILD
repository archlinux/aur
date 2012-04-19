# Maintainer: Constantin Schomburg <me@xconstruct.net>

pkgname=mcpatcher
pkgver='2.3.6_01'
pkgrel=1
pkgdesc="Minecraft patcher to fix textures with higher than default resolution"
arch=('any')
license=('Public Domain')
url="https://github.com/pclewis/mcpatcher"
depends=('java-runtime')
optdepends=('minecraft: the game itself')
noextract=("$pkgname-$pkgver.jar")
source=(mcpatcher
        https://github.com/downloads/pclewis/mcpatcher/$pkgname-$pkgver.jar)
md5sums=('38358254be76dc84676509f43be44938'
         'a743576a3496f3d9e3d20f7e5733ef30')

build() {
    cd "$srcdir"

    install -vDm755 "mcpatcher"            "$pkgdir/usr/bin/mcpatcher"
    install -vDm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/mcpatcher/mcpatcher.jar"
}

# vim:set ts=4 sw=4 et:
