pkgname=ttf-noto-sans-egyptian-hieroglyphs
_pkgname=NotoSansEgyptianHieroglyphs
pkgver=2.002
pkgrel=0
pkgdesc=""
arch=('any')
url='https://github.com/notofonts/egyptian-hieroglyphs'
license=('OFL-1.1')
source=("$url/releases/download/$_pkgname-v$pkgver/$_pkgname-v$pkgver.zip")
md5sums=(39d2005c293676926234d4edfb5bc858)

package() {
  install -m644 -Dt "$pkgdir/usr/share/fonts/TTF/" "$srcdir/$_pkgname/hinted/ttf/$_pkgname-Regular.ttf"
}
