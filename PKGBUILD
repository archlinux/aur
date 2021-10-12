# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-qurancomplex-fonts
pkgver=20210808
pkgrel=4
pkgdesc="Arabic fonts by King Fahd Glorious Quran Printing Complex in al-Madinah al-Munawwarah"
arch=('any')
url="http://fonts.qurancomplex.gov.sa"
license=('custom')
source=(https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/10/Basmalah-Ver01.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2018/n-06/HafsNastaleeq%20Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/03/KFGQPC_AnLight.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/06/KFGQPC_AnRegular.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2014/07/KFGQPC-Dot-Font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/03/KSAExtra.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/04/KSAHeading.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/03/KSAHeavy.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/03/KSARegular.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2011/06/Outlinedv001.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/10/Shadatain-Ver01.zip
	https://fonts.qurancomplex.gov.sa/download/Symbols1_Ver02.otf
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/01/UthmanicBazzi_v07-font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/12/UthmanicDoori_v09-font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/08/UthmanicHafs1_Ver18.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/08/UthmanicQaloon_Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/08/UthmanicQumbul_v07.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/12/UthmanicShouba_v08-font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2020/12/UthmanicSoosi_v09-font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/08/UthmanicWarsh_Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1-Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1B-Ver10.zip)
sha256sums=(
	'e696b4e60ba24e921954ad15d7209d0322641f0e52d956b3e8606ea5b3501c77'
	'56543ae78f1792b6b8911ba57dd70fb542a311ac0339b1f85563ff446d021442'
	'f3b1edf90a55d8224b689f08d9870e3099079bb5be2a6d7dd66d0234a2509e5c'
	'6011e43b56bf3eff45d6bc6bfe8f17b6049ffe639225a635ded818856c3c8558'
	'7c54efa8de84c31c4a561f19148965b72624a1d87e74eb922220acc8ea5e9f7a'
	'1d9ac6523cfc641ed7b1107036ad2739717a974facd36b2324fe57797cc0b266'
	'10b7368779a7d5b0e16bfd4545fe39277bf3c8f84d890180fe3e5191e14df1f6'
	'f003b2f6b342c08622e5a4eaca285b403b9d791e2ff9480870930c944b44f94e'
	'c6f719734656d2f47e1c783f256386d361584106dbc9f087fd85fd208b388f56'
	'9a164f89ce1340e9abae210a19b4f9a90b13647dd40f84a0aef900073e49f957'
	'df5caf68ef0ecb26a858681eda23b35a1ca18d58df43651744eb16ff1a7bc2c1'
	'3f7746014ff9e4124882e66b4f0e2c11629bbc99f3c42be4ea324988f7572809'
	'464738f0052c4ba943e511c56bc9875a99068193a2aff1cb46adb6586edbb7b3'
	'0b3fb97057f01144428f88abe180fcdf39927d610f9470505153f00300f41149'
	'a6d67e7d6d01b8af401af03a7c5c11c8b5dcd5b12fb737c463863e9db006fb50'
	'd86951b3f1692d77765c83378c6e514a4552c6e50e42eed552cfd64142f102a9'
	'694f6015a15a9f00ee9f93c15057dfb34bde5b5176af34330a3594493e6503da'
	'c6111a89d78ad6a282b901871ce259a565dba367060212ccfe79596f0df3c067'
	'edea604474cb8aa4de4563bda9d31b8a498458a2712fe1d226a1f381fd5e6185'
	'88dd4f5017bcff91417e0d84bc51c8d1a1bd472057af1439601395683294560d'
	'f5a2c73eb3b618e499afbd03d559b5204bcdabb46d59b8b7cacd13a485162bf9'
	'73e7fc1c556cc3a7e3048d90fb26f919688464d7e0c9c0e4815871c13588a8c8')

package() {
  cd "$srcdir"
  shopt -s globstar
  install -Dm644 **/*.[ot]tf -t "$pkgdir/usr/share/fonts/qurancomplex"
  install -Dm644 **/*.doc -t "$pkgdir/usr/share/doc/$pkgname/"
}
