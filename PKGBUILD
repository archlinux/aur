# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=stylua-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='An opinionated code formatter for Lua 5.1 and Luau, built using full-moon.'
url='https://github.com/morganamilo/paru'
source=("$pkgname-$pkgver.tar.gz::https://github.com/JohnnyMorganz/StyLua/releases/download/v$pkgver/stylua-$pkgver-linux.zip")
arch=('any')
license=('MPL-2.0')
conflicts=('stylua-git')
sha256sums=('39858365009e7b1e9bbfefe9cd4b0500a9d9fea6c84de955cdbb390f71012c50')

sha256sums(){
    sha256sum "$pkgname-$pkgver.tar.gz" | cut -d " " -f 1
}

package() {
    cd "$srcdir/"
    install -Dm755 stylua "${pkgdir}/usr/bin/stylua"
}
