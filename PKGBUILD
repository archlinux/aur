# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=ttf-vdrsymbols
pkgver=20100612
pkgrel=1
pkgdesc="TrueType font that includes the symbols used by some VDR plugins and patches"
arch=('any')
license=('custom')
url="http://andreas.vdr-developer.org/fonts/index.html"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('vdrsymbols-ttf')
replaces=('vdrsymbols-ttf')
install=$pkgname.install
source=("http://andreas.vdr-developer.org/fonts/download/vdrsymbols-ttf-20100612.tgz"
        "https://raw.githubusercontent.com/dejavu-fonts/dejavu-fonts/master/LICENSE")
md5sums=('dad98a1cdb2b7deb3301ecf46181d258'
         '449b2c30bfe5fa897fe87b8b70b16cfa')

package() {
  mkdir -p "$pkgdir/usr/share/fonts/TTF"
  install -m644 $srcdir/*/*.ttf $pkgdir/usr/share/fonts/TTF/
  
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


