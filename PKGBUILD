# Maintainer: Anton Leontiev <scileont /at/ gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Baptiste Grenier <baptiste@bapt.name>

pkgname=ttf-andika
pkgver=6.200
pkgrel=1
pkgdesc='A sans serif, Unicode-compliant font designed especially for literacy use'
url='https://software.sil.org/andika/'
arch=('any')
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("https://software.sil.org/downloads/r/andika/Andika-$pkgver.zip")
sha256sums=('cc9a7523fcdecf5d2e1858f8ed43bca8f1e1be1ad5f20ac81475d816a9dcf87c')

package() {
	cd Andika-$pkgver
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" Andika-*.ttf
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/pdf/*
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
