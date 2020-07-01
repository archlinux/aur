# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_fontname=bitter
pkgname=otf-${_fontname}
pkgver=1.300
pkgrel=3
pkgdesc='A font specially designed for comfortably reading on any computer or device.'
arch=('any')
url="http://www.huertatipografica.com/fonts/${_fontname}-ht"
license=('custom:OFL')
conflicts=('otf-google-fonts-hg')
source=("${_fontname}.zip::http://www.fontsquirrel.com/fonts/download/${_fontname}")
sha256sums=('SKIP')

package() {
  install -Dm644 "SIL Open Font License.txt" "$pkgdir"/usr/share/licenses/${pkgname}/SIL_Open_Font_License.txt
  install -d "$pkgdir"/usr/share/fonts/OTF/
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}
