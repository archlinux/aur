# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=fl-studio-integrator
pkgver=1.0.6
pkgrel=1
pkgdesc='Integrate FL Studio with your system'
arch=('any')
url='https://github.com/begin-theadventure/fl-studio-integrator-linux'
license=('custom')
depends=('wine')
source=("https://image-line.com/wp-content/themes/intracto/build/images/fl-header-logo.png"
        "$pkgname.xml"
        "$pkgname.desktop"
        "${pkgname}-elm.desktop"
        "${pkgname}-reg.desktop"
        "$pkgname"
        "${pkgname}-elm"
        "${pkgname}-reg")
sha256sums=('9a2242baba370fa2f06f3c325f7152fbe0831edfd1d6baa6a5347d52b68be889'
            '3b49295e7cbfde851bcd4c64034d5f4d0491a82902ca2212ffbf03e2a84bf927'
            '0dd5be1680235d3957f33a22bafd06006359110ee020262cc0e3fc1d6ec6c383'
            'ca6d51c3946ca5bc58e734137fd1e8dc9a20bfc79cddba0e5a3e2f74ea1608d0'
            '5d77b4746edb67ee20d4e9b2f2986f8b9236c1d9fd8a853e789db7a182bf73ed'
            '3f08eba617f96f9d24b523e3c4372f5c56b1871221917be28dfcbc8c19750324'
            'ba5f6c90b25e2f1cb008f1e456c63fa04a7401cf85a6d423d6467b30649e8006'
            'cb953df6f6e87cef53d3fd7b1fceeea21ffbf58dae8b6ab9e4de72b2c9e6b7be')
backup=("usr/bin/$pkgname"
        "usr/bin/${pkgname}-elm"
        "usr/bin/${pkgname}-reg")

package() {
  install -Dm644 fl-header-logo.png "$pkgdir/usr/share/pixmaps/fl-studio.png"
  install -Dm644 $pkgname.xml -t "$pkgdir/usr/share/mime/packages"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 ${pkgname}-elm.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 ${pkgname}-reg.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm755 ${pkgname}-elm -t "$pkgdir/usr/bin"
  install -Dm755 ${pkgname}-reg -t "$pkgdir/usr/bin"
}
