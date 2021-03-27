# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=stylua-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='An opinionated code formatter for Lua 5.1 and Luau, built using full-moon.'
url='https://github.com/morganamilo/paru'
source=("$pkgname-$pkgver.tar.gz::https://github.com/JohnnyMorganz/StyLua/releases/download/v$pkgver/stylua-$pkgver-linux.zip")
arch=('any')
license=('MPL-2.0')
conflicts=('stylua-git')
sha256sums=('8078e6523123975f10a9e5d368c200cdd0e204223d72d59af3c1db8dd5e92821')

package() {
    cd "$srcdir/"
    install -Dm755 stylua "${pkgdir}/usr/bin/stylua"
}
