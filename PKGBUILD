# Maintainer: farnsworth517 <hikmet1517[at]gmail[dot]com>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>
# Contributor: <cheesinglee@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
pkgname=ttf-sil-fonts
pkgver=6
pkgrel=8
pkgdesc="A collection of OFL-licensed fonts from SIL (Abyssinica, Andika, Annapurna, Apparatus, Charis and more)"
arch=('any')
url="http://scripts.sil.org/OFL_fonts"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-andika' 'ttf-sil-gentium' 'ttf-sil-apparatus' 'ttf-charis' 'ttf-sil-doulos' 'ttf-sil-dai-banna' 'ttf-sil-ezra' 'ttf-sil-lateef' 'ttf-nuosu-sil' 'ttf-padauk' 'ttf-sil-scheherezade' 'ttf-google-fonts-git' 'ttf-google-fonts-hg')
provides=('ttf-andika' 'ttf-sil-gentium' 'ttf-sil-apparatus' 'ttf-charis' 'ttf-sil-doulos' 'ttf-sil-dai-banna' 'ttf-sil-ezra' 'ttf-sil-lateef' 'ttf-nuosu-sil' 'ttf-padauk' 'ttf-sil-scheherezade')
install=${pkgname}.install
source=('abyssinica.zip::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=AbyssinicaSIL-1.500.zip&filename=AbyssinicaSIL-1.500.zip'
        'andika.zip::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=Andika-5.000.zip&filename=Andika-5.000.zip'
        'annapurna.zip::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=annapurna_sil_1_100&filename=AnnapurnaSIL-1.100.zip'
        'apparatus.zip::http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=AppSIL1.0.zip&filename=ApparatusSIL.zip'
        'charis.zip::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=CharisSIL-5.000.zip&filename=CharisSIL-5.000.zip'
        'daibanna.zip::http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=DaiBanna-2.200.zip&filename=DaiBanna-2.200.zip'
        'doulos.zip::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=DoulosSIL-5.000.zip&filename=DoulosSIL-5.000.zip'
        'ezra.zip::http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=EzraSIL251.zip&filename=EzraSIL251.zip'
        'galatia.zip::http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=GalSIL21b.zip&filename=GalSIL21.zip'
        'gentiumplus.zip::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=GentiumPlus-5.000.zip&filename=GentiumPlus-5.000.zip'
        'lateef.zip::http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=Lateef_OT_1_001&filename=LateefRegOT_1.001.zip'
        'modulkiri.zip::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=Mondulkiri-7.100&filename=Mondulkiri-7.100.zip'
        'nuosu.zip::http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=NuosuSIL2.1.1.zip&filename=NuosuSIL2.1.1.zip'
        'padauk.zip::http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=Mh_Padauk_zip&filename=padauk-2.8.zip'
        'scheherezade.zip::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=Scheherazade-2.020.zip&filename=Scheherazade-2.020.zip'
        'sophianubian.zip::http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=SN1.0.zip&filename=SN1.0.zip'
        'taiheritagepro.zip::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=TaiHeritagePro2_5.zip&filename=TaiHeritagePro2_5.zip')
sha1sums=('99cb557f650f29f7f1b38ae248fd6911a02da14b'
          '073c9d02efc6a15ecf38f9abb07d7d6ba976cc7e'
          '0da09965a43c107ec95b5cdeb9c181c99e5c716e'
          'ff1924fea5f984d9249704f179aaa9d6ccf14318'
          'acced0ca9a477f8b139bffad663109a59384d3db'
          '7c233cce8d0a1d5351383e7e58723b79acf17cb6'
          '2a04fb87b79c0c4c3bf0035076355a75eac629ee'
          '97472305eea615f415c7805ba32da01a6d706283'
          '21d3952b39f442f16b9630b2d7cd84ba144cf0db'
          'e7330eea3593509f8848ee5fd2321f1e52284626'
          '376e9c645a43e9e11093f4e2558f871fbad08d14'
          '4f9b37a0af9a0255bf13561cc792aed54aadd037'
          'f4eb4b2f311b10b32627ac984319a058f63a278c'
          'd7d7b72852c19446b95cae3ab45ec178bef7fa9d'
          'da15606e40664f7e1e1e90f2b12cbc451f335ecd'
          '054a64ecf9d3a6158e6f9ebaa8d3736328195f56'
          'c09eecae14ad69b567503ac0b6ec6e459d2acbd3')

package() {
	install -d  ${pkgdir}/usr/share/fonts/TTF

	# Font installation
	install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
	install -m644 ${srcdir}/*/*.ttf ${pkgdir}/usr/share/fonts/TTF

	# License installation
	install -d ${pkgdir}/usr/share/licenses/${pkgname}
	install -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
