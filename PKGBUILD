# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=otf-crimson-text
pkgver=december2013.r0.gfe95931
pkgrel=1
pkgdesc="A font family for book production in the tradition of beautiful oldstyle typefaces."
arch=('any')
url="http://aldusleaf.org/0-crimson.html"
license=('OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=crimson-text.install
source=("$pkgname"::'git://github.com/skosch/Crimson.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 otf/*.otf "$pkgdir/usr/share/fonts/OTF/"
}
