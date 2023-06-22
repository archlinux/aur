pkgname=graph-bars-font
pkgver=1.0
pkgrel=2

pkgdesc="OTF font with vertical bars for one-line ASCII spectrum analyzers, graphs, etc"

arch=('any')
url="https://github.com/and3rson/graph-bars-font"
license=('MIT')

depends=()
makedepends=()
optdepends=()

source=('https://github.com/and3rson/graph-bars-font/blob/a86647bc0700a04f63dc87fc4a4ee89e894eb9a3/Bars-regular.otf')
md5sums=('7b24e73bb6a63796ab006c60da57efbb')

package() {
    install -Dm644 *.otf -t "${pkgdir}/usr/share/fonts/OTF/"
}
