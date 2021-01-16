# Maintainer: Ashymad <czilukim@o2.pl>
pkgname="otf-code-new-roman"
pkgver="2.1"
pkgrel=2
pkgdesc='Monospaced font aimed for use in programming environments'
arch=('any')
url='http://fb.com/Code.New.Roman'
license=('custom')
depends=('fontconfig')
source=('https://fontain.org/code-new-roman/export/otf/code-new-roman.otf.zip')

sha256sums=('88e0fb4a3683e50e14d52722924b7ea7d0893910c39f65bf071ae100f0b75bf7')
            

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 *.otf "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
