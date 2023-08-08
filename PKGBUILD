# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=fl-studio-integrator
pkgver=1.0.2
pkgrel=1
pkgdesc='Integrate FL Studio with your system'
arch=('any')
url='https://github.com/begin-theadventure/fl-studio-integrator-linux'
license=('custom')
depends=('wine')
source=("https://image-line.com/wp-content/themes/intracto/build/images/fl-header-logo.png"
        "$pkgname.xml"
        "$pkgname.desktop"
        "$pkgname")
sha256sums=('9a2242baba370fa2f06f3c325f7152fbe0831edfd1d6baa6a5347d52b68be889'
            '3b49295e7cbfde851bcd4c64034d5f4d0491a82902ca2212ffbf03e2a84bf927'
            '0dd5be1680235d3957f33a22bafd06006359110ee020262cc0e3fc1d6ec6c383'
            'aa971b0959fa823586b02ab782a7571042ccf8751b0be982c9339d749655e6ca')
backup=("usr/bin/$pkgname")

package() {
  install -Dm644 fl-header-logo.png "$pkgdir/usr/share/pixmaps/fl-studio.png"
  install -Dm644 $pkgname.xml -t "$pkgdir/usr/share/mime/packages"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 $pkgname -t "$pkgdir/usr/bin"
}
