# Maintainer: Anton Leontiev <scileont /at/ gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Baptiste Grenier <baptiste@bapt.name>

pkgname=ttf-andika
pkgver=7.000
pkgrel=1
pkgdesc='A sans serif, Unicode-compliant font designed especially for literacy use'
url='https://software.sil.org/andika/'
arch=(any)
license=(OFL)
conflicts=('ttf-sil-fonts<=6')
source=("https://software.sil.org/downloads/r/andika/Andika-$pkgver.zip")
sha256sums=('88ba6ea41ef4a8e5214b090df8fa2983be1babe4843efaa99cdb6078b0e2c070')

package() {
	cd Andika-$pkgver
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" Andika-*.ttf
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt documentation/pdf/*
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
