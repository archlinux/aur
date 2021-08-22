# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Marcos Heredia <chelqo@gmail.com>

pkgbase=fonts-impallari-miltonian
pkgname=(ttf-impallari-miltonian otf-impallari-miltonian)
pkgver=1.7
pkgrel=2
pkgdesc="Two playful fonts for all your informal needs, from Pablo Impallari"
arch=('any')
url="https://github.com/impallari/Miltonian"
license=('custom:OFL')
groups=('impallari-fonts')
source=("$pkgname-$pkgver.tar.gz::$url/archive/master.tar.gz")
sha256sums=('8f7f9464918a75741baa4cbd551d86ea464b75238548e1774e819c9b20c397ae')

package_ttf-impallari-miltonian() {
	provides=('ttf-font')

	cd Miltonian-master
	install -Dm 644 fonts/TTF/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	install -Dm 644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_otf-impallari-miltonian() {
	provides=('otf-font')

	cd Miltonian-master
	install -Dm 644 fonts/OTF/*.otf -t "$pkgdir/usr/share/fonts/OTF/"
	install -Dm 644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
