# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-qurancomplex-fonts
pkgver=20220601
pkgrel=1
pkgdesc="Arabic fonts by King Fahd Glorious Quran Printing Complex in al-Madinah al-Munawwarah"
arch=('any')
url="http://fonts.qurancomplex.gov.sa"
license=('custom')
source=(https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/10/Basmalah-Ver01.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2018/n-06/HafsNastaleeq%20Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2022/06/KFGQPC-An.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2014/07/KFGQPC-Dot-Font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2022/06/KFGQPC-KSA.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2011/06/Outlinedv001.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2018/10/Shadatain-Ver01.zip
	https://fonts.qurancomplex.gov.sa/download/Symbols1_Ver02.otf
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2022/04/UthmanicBazzi_V20.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2022/04/UthmanicDouri_V20.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2021/12/UthmanicHafs_v20_-font.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2022/04/UthmanicQaloun_V21.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2022/04/UthmanicQunbul_V20.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2022/04/UthmanicShuba_V20.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2022/04/UthmanicSousi_V20.zip
	https://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2022/04/UthmanicWarsh_V21.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1-Ver10.zip
	https://fonts.qurancomplex.gov.sa/wp-content/uploads/2012/06/UthmanTN1B-Ver10.zip)
sha256sums=('e696b4e60ba24e921954ad15d7209d0322641f0e52d956b3e8606ea5b3501c77'
            '56543ae78f1792b6b8911ba57dd70fb542a311ac0339b1f85563ff446d021442'
            'e6ea593fe3ec86ea3b1abfdae0b841aacd0f86cf23322dc072e92d6bf626610c'
            '7c54efa8de84c31c4a561f19148965b72624a1d87e74eb922220acc8ea5e9f7a'
            '6805a6148378cd12fc41b35c9ca0e38ac12908c9b77e1a3d6886b923eee9e63c'
            '9a164f89ce1340e9abae210a19b4f9a90b13647dd40f84a0aef900073e49f957'
            'df5caf68ef0ecb26a858681eda23b35a1ca18d58df43651744eb16ff1a7bc2c1'
            '3f7746014ff9e4124882e66b4f0e2c11629bbc99f3c42be4ea324988f7572809'
            'b85cd72fda6f52c08cd5ecadeebfe9f08a5e0d986eecb318e7295f3318feaf66'
            '89fe6773ada1a8c153d24005453fa8c183bc33919887664c102e5a9c9c2c5e67'
            '88f3c5ed6f296c5c61577a7bbe466a83e153b01c34f1f40532739016fa209611'
            '3fbad683024289c7a4d0913ea3967f467ca4e34ec0dd069c60ece0a621c8a5d5'
            'd33a35f7c9c6e416579d810e88c8ab9bfa7d72ff0a78e48e23fac48ae7b81d62'
            '2bdbe2b0aaf340156c09f3d60a0cb8a331533902131d1f3738b65af9e0e9964a'
            'c06cefb2993ab801bb319819a99200598a335cb0200603020493666a8543e722'
            '45ee1b4f531060aeaca63e426f8ed3fcb8bcc991b0a0ea788d29bbb557b2e5f5'
            'f5a2c73eb3b618e499afbd03d559b5204bcdabb46d59b8b7cacd13a485162bf9'
            '73e7fc1c556cc3a7e3048d90fb26f919688464d7e0c9c0e4815871c13588a8c8')

package() {
  cd "$srcdir"
  shopt -s globstar
  install -Dm644 **/*.[ot]tf -t "$pkgdir/usr/share/fonts/qurancomplex"
  install -Dm644 **/*.doc **/*.docx -t "$pkgdir/usr/share/doc/$pkgname/"
}
