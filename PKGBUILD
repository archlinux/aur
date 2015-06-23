# Maintainer: "devzero" (Tim Rice) <t dot rice at ms dot unimelb dot edu dot au>
pkgname=ttf-humor-sans
_realname=Humor-Sans
pkgver=1.0
_licence_name=${_realname}OFL-$pkgver.txt
pkgrel=2
pkgdesc="A sanserif typeface in the style of xkcd."
arch=(any)
url="http://xkcdsucks.blogspot.com.au/2009/03/xkcdsucks-is-proud-to-present-humor.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://antiyawn.com/uploads/$_realname-$pkgver.ttf http://antiyawn.com/uploads/$_licence_name)

build() { :
}
package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -D -m644 "$_licence_name" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('acdc29df52454684fe8f3184f6477290'
         '5e34faa99b0587e34636534175810dc3')
