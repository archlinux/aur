#Maintainer: blucell <mokhtar92@gmail.com>
#Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=ttf-arabeyes-fonts
pkgver=20150617
pkgrel=1
pkgdesc="A collection of free Arabic and Farsi TrueType fonts"
url="http://www.arabeyes.org/project.php?proj=Khotot"
license=(GPL)
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('fonts-arabeyes')
replaces=('fonts-arabeyes')
install=$pkgname.install
source=(
"http://downloads.sourceforge.net/project/arabeyes/Fonts/ae_fonts/ae_fonts_decorative-2.1.tar.bz2" \
"http://downloads.sourceforge.net/project/arabeyes/Fonts/farsi_fonts/farsi_fonts_0.4.tar.bz2" \
"http://downloads.sourceforge.net/project/arabeyes/kacst_fonts/kacst_fonts_2.01.tar.bz2" \
"http://downloads.sourceforge.net/project/arabeyes/kacst_fonts/kacst_one_5.0.tar.bz2" \
"http://downloads.sourceforge.net/project/arabeyes/Fonts/lateef.shaikh_fonts/lateef.shaikh_fonts.tar.bz2" \
"http://downloads.sourceforge.net/project/arabeyes/Fonts/Mothanna%200.02/Mothanna-0.02.tar.gz" \
"http://downloads.sourceforge.net/project/arabeyes/Fonts/sharif.univ/sharif.univ_ttf.bz2" \
"http://downloads.sourceforge.net/project/arabeyes/Fonts/Thabit%200.02/Thabit-0.02.tar.gz"
)
md5sums=(
	'6bfe75ec3e73cc8b3900b4facb84418e' \
	'1086b47dbbc42e6239881a4217ffc85f' \
	'c8bc5b4cad7f2127d1aa32f399d660d2' \
	'0a7ad4538d3b97adfbefa4c5cf8c2660' \
	'b0bc9c302e0ad006a15618885b521d44' \
	'b95aee9d0ace5f2a3796097cb871563a' \
	'69d35fce17bb1278bd57759bc618d74b' \
	'51462160b22fadeae6cb5dd18da3dfb3'
)

package() {
	cd $srcdir
	mv sharif.univ_ttf sharif-univ.ttf
	install -d $pkgdir/usr/share/fonts/TTF
	find . -name "*.ttf" -exec install -m644 {} $pkgdir/usr/share/fonts/TTF/ \;
}
