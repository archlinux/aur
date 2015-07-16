pkgname=ttf-nishiki-teki
pkgver=2.80
pkgrel=1
pkgdesc="A Unicode-based font inspired by a free shell of Ukagaka called “Nishiki”."
arch=('any')
url="http://hwm3.gyao.ne.jp/shiroi-niwatori/nishiki-teki.htm"
license=("unknown")
depends=('fontconfig' 'xorg-font-utils')
install='install'
source=("http://hwm3.gyao.ne.jp/shiroi-niwatori/nishiki-teki_${pkgver//./_}.zip")
sha256sums=('0f0eced466e80e7ddc95eca4faba0dcf0cbc2e99f9f974747ae7d3217cb58546')

package() {
 cd $srcdir/nishiki-teki_${pkgver//./_}

 install -Dm644 nishiki-teki.ttf $pkgdir/usr/share/fonts/TTF/nishiki-teki.ttf

 install -Dm644 nishiki-teki.htm $pkgdir/usr/share/doc/$pkgname/nishiki-teki.htm
 install -Dm644 img/banner_nishiki-teki.png $pkgdir/usr/share/doc/$pkgname/img/banner_nishiki-teki.png
 install -Dm644 img/nishiki.css $pkgdir/usr/share/doc/$pkgname/img/nishiki.css
}
