# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=stylua-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='An opinionated code formatter for Lua 5.1 and Luau, built using full-moon.'
url='https://github.com/morganamilo/paru'
source=("$pkgname-$pkgver.tar.gz::https://github.com/JohnnyMorganz/StyLua/releases/download/v$pkgver/stylua-$pkgver-linux.zip")
arch=('any')
license=('MPL-2.0')
conflicts=('stylua')
sha256sums=('aafff74f270c6d2cca0e7d10cd17a754ecb445a927983d1be9cf60085541b475')

package() {
    cd "$srcdir/"
    install -Dm755 stylua "${pkgdir}/usr/bin/stylua"
}
