# Maintainer: Julius2 <lt_a_p@yahoo.co.uk>
# Original font design by Jakob Fischer <admin@pizzadude.dk>

pkgname=ttf-pizzadude-bullets
pkgver=2.0
pkgrel=2
url="http://www.pizzadude.dk"
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A dingbats-style symbolic font that displays happy faces, stars, arrows, eyes, hearts, and more."
arch=('any')
license=('custom')
source=(pizzadude_bullets.zip::http://img.dafont.com/dl/?f=pizzadude_bullets)
install=$pkgname.install
md5sums=('9ecfa31321fa775367864042dc1daded')

build() {
  cd $srcdir
  mkdir -p "${pkgdir}/usr/share/fonts/TTF"

install -Dm 644 PIZZADUDEBULLETS.ttf 	$pkgdir/usr/share/fonts/TTF/pizzadude-bullets.ttf
install -Dm 644 pizzadudedotdk.txt 	$pkgdir/usr/share/licenses/$pkgname/license.txt
}

