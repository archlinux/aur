# Contributor: Constantin Schomburg <me@xconstruct.net>
# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>

pkgname=mcpatcher
pkgver='2.4.2_03'
pkgrel=2
pkgdesc="Minecraft patcher to fix textures with higher than default resolution"
arch=('any')
license=('Public Domain')
url="https://github.com/pclewis/mcpatcher"
depends=('java-runtime')
optdepends=('minecraft: the game itself')
noextract=("$pkgname-$pkgver.jar")
changelog=ChangeLog
source=(mcpatcher
        mcpatcher.desktop
        https://github.com/downloads/pclewis/mcpatcher/$pkgname-$pkgver.jar)
md5sums=('38358254be76dc84676509f43be44938'
         '37c9c1d09bdf97f60a2c46a7fabbd931'
         'acf12fb6c39263b2e7e8b2714418a796')

build() {
    cd "$srcdir"

    install -vDm755 "mcpatcher"            "$pkgdir/usr/bin/mcpatcher"
    install -vDm644 "mcpatcher.desktop"    "$pkgdir/usr/share/applications/mcpatcher.desktop"
    install -vDm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/mcpatcher/mcpatcher.jar"
}

# vim:set ts=4 sw=4 et:
