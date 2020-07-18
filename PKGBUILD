# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nssnippets-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A command-line tool for generating NWScript VSC snippets (binary version)"
arch=('any')
url="https://gitlab.com/Taro94/nwscript-snippets"
license=('GPL')
source=("https://gitlab.com/Taro94/nwscript-snippets/uploads/e15c3040b26065b9ace3c962b50bfc0a/nssnippets.tar.7z")
md5sums=('307ef66c99bb321e6ccac366fa44dfc7')
options=(!strip)

package() {
    tar -xvf nssnippets.tar
    install -Dm 755 "nssnippets" -t "$pkgdir/usr/bin"
}
