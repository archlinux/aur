# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nssnippets-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A command-line tool for generating NWScript VSC snippets (binary version)"
arch=('any')
url="https://gitlab.com/Taro94/nwscript-snippets"
license=('GPL')
source=("https://gitlab.com/Taro94/nwscript-snippets/uploads/74b6a4ba2bcc4308ad57b6b47952e74a/nssnippets.tar.7z")
md5sums=('890fd62d9c100a354cea9bed114f1b53')
options=(!strip)

package() {
    tar -xvf nssnippets.tar
    install -Dm 755 "nssnippets" -t "$pkgdir/usr/bin"
}
