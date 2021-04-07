# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nssnippets-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A command-line tool for generating NWScript VSC snippets (binary version)"
arch=('any')
url="https://gitlab.com/Taro94/nwscript-snippets"
license=('GPL')
source=("https://gitlab.com/Taro94/nwscript-snippets/uploads/2f2269eb51567c585d612a7dbb51f86c/nssnippets.tar.7z")
md5sums=('c1e5d3c5dc3412f5a2f32f8faddee300')
options=(!strip)

package() {
    tar -xvf nssnippets.tar
    install -Dm 755 "nssnippets" -t "$pkgdir/usr/bin"
}
