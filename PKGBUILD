# Maintainer: HyperTTP <jonas10bork at gmail dot com>

pkgname=minorg
pkgver=2.4.5
pkgrel=1
pkgdesc="Neorg related tool to convert Pandoc json to norg written in the Nim language"
arch=('x86_64')
url="https://github.com/pysan3/minorg"
license=('GPL')
changelog=
source=("https://github.com/pysan3/$pkgname/releases/download/v$pkgver/$pkgname-linux_x64.tar.gz")
# sha sums can be generated using `makepkg -g`
sha256sums=('8242b74a5f91a40aa028aa41906531f87e004fb48f1437a0122c842e3067cb6e')

package() {
    mkdir -p "$pkgdir/usr/bin"
    mv "$pkgname" "$pkgdir/usr/bin"
}

