# Maintainer: HyperTTP <jonas10bork at gmail dot com>

pkgname=minorg
pkgver=2.4.6
pkgrel=1
pkgdesc="Neorg related tool to convert Pandoc json to norg written in the Nim language"
arch=('x86_64')
url="https://github.com/pysan3/minorg"
license=('GPL')
changelog=
source=("https://github.com/pysan3/$pkgname/releases/download/v$pkgver/$pkgname-linux_x64.tar.gz")
# sha sums can be generated using `makepkg -g`
sha256sums=('54c461a6b8f085771be8c75bbe85c3edde278c9e45494f0e460a4e6260df4013')

package() {
    mkdir -p "$pkgdir/usr/bin"
    mv "$pkgname" "$pkgdir/usr/bin"
}

