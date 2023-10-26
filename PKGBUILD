pkgname=ttf-misans-l3
pkgver=1.000
pkgrel=1
pkgdesc='MiSans L3 font'
arch=('any')
url='https://hyperos.mi.com/font/rare-word'
license=('custom')
depends=('fontconfig')
source=("https://hyperos.mi.com/font-download/MiSans_L3.zip")
md5sums=('08975bcc46a2236a69056103414e3ce7')

package() {
    install -Dm644 "$srcdir/MiSans L3/MiSans L3.ttf" "$pkgdir/usr/share/fonts/TTF/MiSansL3.ttf"
}
