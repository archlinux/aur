# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=ttf-niceandripe
pkgver=1.0
pkgrel=5
pkgdesc='Some fonts * Hand by Nice and Ripe Ltd'
arch=('any')
license=('custom: Free for personal use')
url='http://www.niceandripe.com/fonts/'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("hand_of_sean-${pkgver}.zip::http://img.dafont.com/dl/?f=hand_of_sean"
	"tidy_hand-${pkgver}.zip::http://img.dafont.com/dl/?f=tidy_hand"
	"seans_other_hand-${pkgver}.zip::http://img.dafont.com/dl/?f=seans_other_hand")
sha256sums=('cb476af2a641bb6f9de36bcef14ef6d7b55f05fd449add4097b3bd9fc684b13d'
            '93828baf84dd4d51eb6d42d63a824b8bec10effb417987f6e9448912586a0cc8'
            '0d95590bad0ab15af1df10e0145b4de16b4b3f28fe8174c1019cac6a160e5c22')

package() {
	install -d "${pkgdir}"/usr/share/fonts/TTF/
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}

