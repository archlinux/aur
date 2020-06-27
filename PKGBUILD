# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-qurancomplex-fonts
pkgver=20191101
pkgrel=1
pkgdesc="Arabic fonts by King Fahd Glorious Quran Printing Complex in al-Madinah al-Munawwarah"
arch=('any')
url="http://fonts.qurancomplex.gov.sa"
license=('custom')
source=(https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/10/Basmalah-Ver01.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2019/11/Hafs-ver13.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2018/n-06/HafsNastaleeq%20Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2014/07/KFGQPC-Dot-Font.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2011/06/Outlinedv001.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/10/Shadatain-Ver01.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/11/UthmanicBazzi1-Ver06.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2018/n-01/UthmanicDoori1%20Ver05.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2018/n-02/UthmanicQaloon1%20Ver5.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/11/UthmanicQumbul1-Ver05.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2018/n-03/UthmanicShouba1%20Ver05.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2018/n-04/UthmanicSoosi1%20Ver5.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2018/n-05/UthmanicWarsh1%20Ver5.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1-Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1B-Ver10.zip
	https://fonts.qurancomplex.gov.sa/download/Symbols1_Ver02.otf)
sha256sums=(
	'e696b4e60ba24e921954ad15d7209d0322641f0e52d956b3e8606ea5b3501c77'
	'f7f7b5b72cfe34c5617548d928f6adb360ef8637d2c2e7128906d01fdb276fae'
	'56543ae78f1792b6b8911ba57dd70fb542a311ac0339b1f85563ff446d021442'
	'7c54efa8de84c31c4a561f19148965b72624a1d87e74eb922220acc8ea5e9f7a'
	'9a164f89ce1340e9abae210a19b4f9a90b13647dd40f84a0aef900073e49f957'
	'df5caf68ef0ecb26a858681eda23b35a1ca18d58df43651744eb16ff1a7bc2c1'
	'fd2eef1f336f708e6fbaebae9f9960a443d58721ca65eecfd1137adbc2ece482'
	'ab873f8ea5f8ab06455de98deecb2a58729e0c6c717900f389727994031fc9b0'
	'd0bb2bc8190859e3e74e858c497e906fd1d065c4801464cd30417e64cf307eb2'
	'3504fdb67a7c1c8603b3519579e3de5e1c78925800bbefe8627c54794a07ad8e'
	'16976ffac06b12b9d7410c8004310cff0d4cacfc454415777f85c7d2b3e96778'
	'cdd60e2afe047a7f081f9e906047cc9104c1117617cf0e311037e338739e1c9a'
	'a0985b030e6cd61b43cff36d3787089ec31c8de674763f8b373a553a6f912086'
	'f5a2c73eb3b618e499afbd03d559b5204bcdabb46d59b8b7cacd13a485162bf9'
	'73e7fc1c556cc3a7e3048d90fb26f919688464d7e0c9c0e4815871c13588a8c8'
	'3f7746014ff9e4124882e66b4f0e2c11629bbc99f3c42be4ea324988f7572809')

package() {
  cd "$srcdir"
  install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/TTF"
}
