# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=stylua-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='An opinionated code formatter for Lua 5.1 and Luau, built using full-moon.'
url='https://github.com/morganamilo/paru'
source=("$pkgname-$pkgver.zip::https://github.com/JohnnyMorganz/StyLua/releases/download/v$pkgver/stylua-$pkgver-linux.zip")
arch=('any')
license=('MPL-2.0')
conflicts=('stylua-git')
sha256sums=('69a9e4015b4d0d8fe50232d746d4179783deca882564d452663677d3f11c057a')

package() {
    cd "$srcdir/"
    install -Dm755 stylua "${pkgdir}/usr/bin/stylua"
}
