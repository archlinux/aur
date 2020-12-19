# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-qurancomplex-fonts
pkgver=20200801
pkgrel=1
pkgdesc="Arabic fonts by King Fahd Glorious Quran Printing Complex in al-Madinah al-Munawwarah"
arch=('any')
url="http://fonts.qurancomplex.gov.sa"
license=('custom')
source=(https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/10/Basmalah-Ver01.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/07/Bazzi.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/07/Doori.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2018/n-06/HafsNastaleeq%20Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2014/07/KFGQPC-Dot-Font.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2011/06/Outlinedv001.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/07/Qaloon.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/07/Qumbul.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/10/Shadatain-Ver01.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/07/Shouba.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/07/Soosi.zip
	https://fonts.qurancomplex.gov.sa/download/Symbols1_Ver02.otf
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/08/UthmanicHafs1-Ver14.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1-Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1B-Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/07/Warsh.zip)
sha256sums=(
	'e696b4e60ba24e921954ad15d7209d0322641f0e52d956b3e8606ea5b3501c77'
	'7180b05e52e72f18304f576e8f4b3863986a73416d2b1acc666b97353b315a1d'
	'949281e8b151e362191784678542897d758a5a55e2c813593d7b74a60f668737'
	'56543ae78f1792b6b8911ba57dd70fb542a311ac0339b1f85563ff446d021442'
	'7c54efa8de84c31c4a561f19148965b72624a1d87e74eb922220acc8ea5e9f7a'
	'9a164f89ce1340e9abae210a19b4f9a90b13647dd40f84a0aef900073e49f957'
	'5a6eb42ea9a8fc7226118e7ed10af046f5b0bd254c5bbe93a9f27cf1204aeb85'
	'05fd3ac9f164577a7bfec786d9e0d3f9ac31635c42b5caaaafb45c6f8cc95ee7'
	'df5caf68ef0ecb26a858681eda23b35a1ca18d58df43651744eb16ff1a7bc2c1'
	'95065625dcffaab88c9974e456b7fabc12c1f2afd648d8164c5fc6457fe7a510'
	'25f4422a0e93c3077ac6115222114688c09fb279791a15fcadef550b625c16ad'
	'3f7746014ff9e4124882e66b4f0e2c11629bbc99f3c42be4ea324988f7572809'
	'6ae5d10ad25b7f83b817e8b9afcd42556a16288de6036795d309ca0e93c2dc28'
	'f5a2c73eb3b618e499afbd03d559b5204bcdabb46d59b8b7cacd13a485162bf9'
	'73e7fc1c556cc3a7e3048d90fb26f919688464d7e0c9c0e4815871c13588a8c8'
	'ec27e7e27f61f63fad0fe0acb44cb9653a9c1aea83e02c34ef23cc92e60166c4')

package() {
  cd "$srcdir"
  install -Dm644 *.otf */*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.doc */[^~]*.doc -t "$pkgdir/usr/share/doc/$pkgname/"
}
