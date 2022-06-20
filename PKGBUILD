pkgname=otf-ems-serenissima
pkgver=1.01
pkgrel=1
pkgdesc="Music font emulating the most common way music was printed in the 16th and 17th centuries"
arch=(any)
url="https://www.earlymusicsources.com/more/font-serenissima"
license=('CCPL') #cc-by-3.0
source=("$pkgname-$pkgver.otf::https://tinyurl.com/y4qnewpd")
sha256sums=('f242c0e906c109ca824d26ed984c266aeb998fb86e91440977803445ee52e70d')

package() {
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" *otf
}

