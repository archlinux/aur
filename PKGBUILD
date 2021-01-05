# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-qurancomplex-fonts
pkgver=20210101
pkgrel=1
pkgdesc="Arabic fonts by King Fahd Glorious Quran Printing Complex in al-Madinah al-Munawwarah"
arch=('any')
url="http://fonts.qurancomplex.gov.sa"
license=('custom')
source=(https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/10/Basmalah-Ver01.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2018/n-06/HafsNastaleeq%20Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2014/07/KFGQPC-Dot-Font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/11/KSA2020Heading.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/10/KSA2020Heavy.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/01/KSA2020Extra.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2011/06/Outlinedv001.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/10/Shadatain-Ver01.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/01/UthmanicBazzi_v07-font.zip
	https://fonts.qurancomplex.gov.sa/download/Symbols1_Ver02.otf
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/12/UthmanicDoori_v09-font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/12/UthmanicHafs_v16-font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/12/UthmanicQaloon_v09-font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/12/UthmanicQumbul_v07-font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/12/UthmanicShouba_v08-font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/12/UthmanicSoosi_v09-font.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1-Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1B-Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/01/UthmanicWarsh_v9-font.zip)
sha256sums=(
	'e696b4e60ba24e921954ad15d7209d0322641f0e52d956b3e8606ea5b3501c77'
	'56543ae78f1792b6b8911ba57dd70fb542a311ac0339b1f85563ff446d021442'
	'7c54efa8de84c31c4a561f19148965b72624a1d87e74eb922220acc8ea5e9f7a'
	'38be579dd362fb2bf55f75abbeddcc016857d9ccf446600e848f0a36df0896df'
	'02b2d5d24b1673bea13b0bbc2b169cc5ee2ac131c8d5f18d2c5212d686505c16'
	'f5e2cd7973c1cf1a3988e5961a62c84eaf4c4ea38b2955d16507e4611d9599d1'
	'9a164f89ce1340e9abae210a19b4f9a90b13647dd40f84a0aef900073e49f957'
	'df5caf68ef0ecb26a858681eda23b35a1ca18d58df43651744eb16ff1a7bc2c1'
	'464738f0052c4ba943e511c56bc9875a99068193a2aff1cb46adb6586edbb7b3'
	'3f7746014ff9e4124882e66b4f0e2c11629bbc99f3c42be4ea324988f7572809'
	'0b3fb97057f01144428f88abe180fcdf39927d610f9470505153f00300f41149'
	'dfa52666259ccbbe9619b8004ccd9831d8199c39593a85cf4bb482f6c536caaf'
	'db05facd97cf87d2bc0f357db2eae260c34dba627031df27a2233faaf3ec38b5'
	'5665abd9747d625643dfb923ebaee8581df35b4bd2f9e7992ccee0b8e986f137'
	'c6111a89d78ad6a282b901871ce259a565dba367060212ccfe79596f0df3c067'
	'edea604474cb8aa4de4563bda9d31b8a498458a2712fe1d226a1f381fd5e6185'
	'f5a2c73eb3b618e499afbd03d559b5204bcdabb46d59b8b7cacd13a485162bf9'
	'73e7fc1c556cc3a7e3048d90fb26f919688464d7e0c9c0e4815871c13588a8c8'
	'bb57fac2e962f44e2783b62914d6835ec75fe9e94f8daf80ec8ca435fe3eadcc')

package() {
  cd "$srcdir"
  install -Dm644 *.[ot]tf */*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.doc */[^~]*.doc -t "$pkgdir/usr/share/doc/$pkgname/"
}
