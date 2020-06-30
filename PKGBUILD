# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=ttf-niceandripe
pkgver=1.0
pkgrel=7
pkgdesc='Some fonts * Hand by Nice and Ripe Ltd'
arch=('any')
license=('custom: Free for personal use')
url='http://www.niceandripe.com/fonts/'
depends=('fontconfig' 'xorg-fonts-encodings')
source=("hand_of_sean-${pkgver}.zip::http://img.dafont.com/dl/?f=hand_of_sean"
	"tidy_hand-${pkgver}.zip::http://img.dafont.com/dl/?f=tidy_hand"
	"seans_other_hand-${pkgver}.zip::http://img.dafont.com/dl/?f=seans_other_hand")
sha256sums=('4622eeb7f7ec4df709f67dbfe3d97a0418806723032bd1ffc23ff0ec42d33691'
            'b9896b4cb1a0e89706bb1df2a59935b68cf79d994f29cd5a959b9969acd68751'
            'b85ba4dff1d46d503d08203972157ff65e3cb4ed2bf7de83f07b9d9c123cacf4')

package() {
	install -d "${pkgdir}"/usr/share/fonts/TTF/
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}

