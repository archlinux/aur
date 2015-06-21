# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Hilton Medeiros <medeiros.hilton at gmail.com>

pkgname=otf-crimson-text
pkgver=2014.06
pkgrel=1
epoch=1
pkgdesc="A font family for book production in the tradition of beautiful oldstyle typefaces"
arch=('any')
url="https://github.com/skosch/Crimson/"
license=('OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=crimson-text.install
source=("$pkgname".zip::'https://github.com/skosch/Crimson/archive/master.zip')
md5sums=('SKIP')

package() {
  cd "$srcdir/Crimson-master/Desktop Fonts"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 OTF/*.otf "$pkgdir/usr/share/fonts/OTF/"
}
