# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=otf-quivira
pkgver=4.1
pkgrel=1
pkgdesc="Unicode-based OpenType font with a large character repertoire"
arch=('any')
url="http://www.quivira-font.com"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.quivira-font.com/files/Quivira.otf' 'LICENSE')
install=$pkgname.install
md5sums=('35b77765018ffd77dd5d56c4d55de124' 'a543bc4880aeb2b0d427d4ac2fc76980')

package() {
  install -Dm644 Quivira.otf "${pkgdir}/usr/share/fonts/OTF/Quivira.otf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

