# Maintainer: xNN <xNNism@gmail.com>

pkgname=ttf-tannenberg
pkgver=1.0.0
pkgrel=1
pkgdesc="Old WW2 era font used for creating historical documents and artwork"
arch=('any')
url="http://www.dafont.com/tannenberg-fett.font"
license=('SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=ttf-tannenberg.install
source=("https://github.com/Blackbyte-Inc/ttf-tannenberg/raw/master/tannenberg.bold.ttf"
	"https://github.com/Blackbyte-Inc/ttf-tannenberg/raw/master/tannenberg.contour.ttf"
	"https://github.com/Blackbyte-Inc/ttf-tannenberg/raw/master/tannenberg.shadow.ttf")
sha256sums=('c4b1a086515ef1b94453523c6133eedeabbd809113dbdddd5e72aae8b99b36cc'
	    '020118f0a1f5965a76c7fd5939652b4dd436d495392a59734a58edabe8d2907f'
	    'ace761c42abe229bf8e0f8234cf17bedbe6f317ec499bcdfd9fd217e0bf78227')

package() {
  install -dm 755 "${pkgdir}"/usr/share/fonts/TTF
  install -m 644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}