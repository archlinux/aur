# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-qurancomplex-fonts
pkgver=20140709
pkgrel=1
pkgdesc="Arabic fonts by King Fahd Glorious Quran Printing Complex in al-Madinah al-Munawwarah"
arch=('any')
url="http://fonts.qurancomplex.gov.sa"
license=('custom')
install=font.install
source=(http://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1-Ver10.zip
	http://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1B-Ver10.zip
	http://fonts.qurancomplex.gov.sa/download/UthmanicHafs1Ver09Font.zip
	http://fonts.qurancomplex.gov.sa/download/Symbols1_Ver02.otf
	http://fonts.qurancomplex.gov.sa/wp-content/uploads/2011/06/Outlinedv001.zip
	http://fonts.qurancomplex.gov.sa/wp-content/uploads/2014/07/KFGQPC-Dot-Font.zip)
sha256sums=('f5a2c73eb3b618e499afbd03d559b5204bcdabb46d59b8b7cacd13a485162bf9'
            '73e7fc1c556cc3a7e3048d90fb26f919688464d7e0c9c0e4815871c13588a8c8'
            'c1cb5267c6ce28bb8169417d5d94fa2b2285efd38ed4057bca741184fb416a12'
            '3f7746014ff9e4124882e66b4f0e2c11629bbc99f3c42be4ea324988f7572809'
            '9a164f89ce1340e9abae210a19b4f9a90b13647dd40f84a0aef900073e49f957'
	    '7c54efa8de84c31c4a561f19148965b72624a1d87e74eb922220acc8ea5e9f7a')
          
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/TTF"
}
