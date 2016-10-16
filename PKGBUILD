# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
pkgname=ttf-andika
pkgver=5.000
pkgrel=1
pkgdesc='A sans serif, Unicode-compliant font designed especially for literacy use'
url='http://software.sil.org/andika/'
arch=('any')
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-sil-fonts')
source=(http://software.sil.org/downloads/d/andika/Andika-$pkgver.zip)
md5sums=('b1667e145cdf1f074887b632d72a52d4')

package() {
	cd Andika-$pkgver
	install -Dm644 Andika-R.ttf "$pkgdir/usr/share/fonts/TTF/AndikaRegular.ttf"
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.txt "$pkgdir/usr/share/andika/README"
	install -m644 FONTLOG.txt "$pkgdir/usr/share/andika/FONTLOG"
	install -m644 documentation/Andika-features.pdf "$pkgdir/usr/share/andika/Andika-features.pdf"
}
