# Maintainer: Thenujan Sandramohan <sthenujan2002@gmail.com>
pkgname=bamini-tamil-font
pkgver=1
pkgrel=1
epoch=
pkgdesc="Bamini tamil language font"
arch=('any')
url="https://tamilfont.net"
license=('unknown')
source=("https://tamilfont.net/wp-content/uploads/bamini.zip")
sha256sums=('53fca96e0fc31ff2905a132979904b8acb6a53a591d0cb3b305ebd087fe3650e')

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 "$srcdir/"*.TTF "$pkgdir/usr/share/fonts/TTF/"
}
