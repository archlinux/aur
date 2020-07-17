# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nssnippets-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A command-line tool for generating NWScript VSC snippets (binary version)"
arch=('any')
url="https://gitlab.com/Taro94/nwscript-snippets"
license=('GPL')
source=("https://gitlab.com/Taro94/nwscript-snippets/uploads/a5a280623f6586953852c2f0b09dc9ba/nssnippets.tar.7z")
md5sums=('881155caac759eb162c4814850a661c3')
options=(!strip)

package() {
    tar -xvf nssnippets.tar
    install -Dm 755 "nssnippets" -t "$pkgdir/usr/bin"
}
