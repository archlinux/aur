# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ttf-bazin-proposed-punctuation
_fname=Bazin
pkgver=1
pkgrel=1
pkgdesc='A TrueType implementation of proposed, non-canonical punctuation marks from Hervé Bazin'
arch=('any')
url='http://jonathanzong.github.io/proposed-punctuation/'
license=('')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("https://github.com/jonathanzong/proposed-punctuation/raw/master/assets/${_fname}.ttf")
sha256sums=('f7880d91b2698a7646f87fc46ce9c549eebf3d78ab5cbceb570bd1c0c20e37b6')

package() {
    install -Dm644 ${_fname}.ttf ${pkgdir}/usr/share/fonts/TTF/${_fname}.ttf
}
