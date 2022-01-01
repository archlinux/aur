# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=stylua-bin
pkgver=0.11.3
pkgrel=1
pkgdesc='An opinionated code formatter for Lua 5.1 and Luau, built using full-moon.'
url='https://github.com/JohnnyMorganz/StyLua'
source=("$pkgname-$pkgver.zip::https://github.com/JohnnyMorganz/StyLua/releases/download/v$pkgver/stylua-$pkgver-linux.zip")
arch=('any')
license=('MPL-2.0')
conflicts=('stylua-git')
sha256sums=('SKIP')

package() {
    cd "$srcdir/"
    install -Dm755 stylua "${pkgdir}/usr/bin/stylua"
}
