#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-amita
pkgver=1.000
pkgrel=1
pkgdesc="Unicode fancy font for Devanagari."
url="http://github.com/etunni/Amita"
license=('custom:OFL')
arch=(any)
pre_url="https://raw.githubusercontent.com/etunni/Amita/master/TTF/Amita"
source=("$pre_url-Regular.ttf"
	"$pre_url-Bold.ttf"
)
md5sums=('06b2567e94cf17248181c6d120b61726'
         'ae07ba68dbb0793c9209137538d06668')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF/devanagari"
	install -t "$pkgdir/usr/share/fonts/TTF/devanagari" -m644 *.ttf
}

