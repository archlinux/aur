# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nssnippets-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A command-line tool for generating NWScript VSC snippets (binary version)"
arch=('any')
url="https://gitlab.com/Taro94/nwscript-snippets"
license=('GPL')
source=("https://gitlab.com/Taro94/nwscript-snippets/uploads/1dcad24796db14d23ea27a7fbda11bfd/nssnippets.tar.7z")
md5sums=('992bfb95aaac7aaf4f3c6ccacd39b6b0')
options=(!strip)

package() {
    tar -xvf nssnippets.tar
    install -Dm 755 "nssnippets" -t "$pkgdir/usr/bin"
}
