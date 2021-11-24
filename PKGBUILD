# Maintainer: Munzir Taha <munzirtaha at gmail.com>
# Contributor: Wyegu <bsdazs17 at gmail dot com>
# Contributor: Firmicus <firmicus at gmx dot net>
pkgname=ttf-sil-scheherazade
pkgver=3.300
pkgrel=1
pkgdesc="An Arabic Naskh-style Unicode typeface"
arch=('any')
url="https://software.sil.org/scheherazade/"
license=('OFL')
source=("https://software.sil.org/downloads/r/scheherazade/ScheherazadeNew-$pkgver.zip")
sha256sums=('fe526c7a2e234f2f08ce3d8f58611ba37bb0495940510767697c034288ba61c3')

package() {
	cd "$srcdir/ScheherazadeNew-$pkgver"
	install -Dm644 *.ttf -t ${pkgdir}/usr/share/fonts/TTF/
	install -Dm644 OFL.txt OFL-FAQ.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/
	install -Dm644 README.txt FONTLOG.txt -t "$pkgdir/usr/share/doc/$pkgname/"
	cp -R documentation web "$pkgdir/usr/share/doc/$pkgname/"
}
