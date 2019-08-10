# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_fontname=bitter
pkgname=otf-${_fontname}
pkgver=1.300
pkgrel=1
pkgdesc='A font specially designed for comfortably reading on any computer or device.'
arch=('any')
url="http://www.huertatipografica.com/fonts/${_fontname}-ht"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
conflicts=('otf-google-fonts-hg')
source=("${_fontname}.zip::http://www.fontsquirrel.com/fonts/download/${_fontname}")
sha256sums=('291861afc335d5011f74d093bfbcbd82599ce06c0982f13ef74312380ea24e84')

package() {
  install -Dm644 "SIL Open Font License.txt" "$pkgdir"/usr/share/licenses/${pkgname}/OFL
  install -d "$pkgdir"/usr/share/fonts/OTF/
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}
