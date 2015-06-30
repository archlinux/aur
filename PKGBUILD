# Maintainer: Adiel Mittmann <adiel@inf.ufsc.br>
pkgname=ttf-siddhanta
pkgver=20140319
pkgrel=1
pkgdesc="A beautiful font for the Devanagari script."
arch=('any')
url="https://sites.google.com/site/bayaryn/"
license=('cc-by-nc-nd-3.0')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=('https://sites.google.com/site/bayaryn/siddhanta.ttf' LICENSE)
md5sums=('2a5926f0248a38ec0f11c9835898bcc8'
         'afc2a94432491e466a41371fbd4791e3')

package() {
  install -m 644 -D $srcdir/siddhanta.ttf $pkgdir/usr/share/fonts/TTF/siddhanta.ttf
  install -m 644 -D $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
