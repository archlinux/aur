pkgname=fonts-churchslavonic
pkgver=1.1
pkgrel=1
pkgdesc="Unicode-encoded OTF and TTF fonts for Church Slavonic"
arch=('any')
license=('SIL' 'GNUv3')
url="https://github.com/typiconman/fonts-cu/"
url="https://www.ctan.org/pkg/fonts-churchslavonic"
replaces=('otf-churchslavonic')
provides=('otf-churchslavonic')
install=$pkgname.install
source=("http://mirrors.ctan.org/fonts/${pkgname}.zip")

package() {
  cd "$srcdir/${pkgname}"
  mkdir -p $pkgdir/usr/share/{fonts/OTF,fonts/TTF,licenses/$pkgname}/
  install -Dm644 *.otf $pkgdir/usr/share/fonts/OTF/
  install -Dm644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -Dm644 docs/fonts-churchslavonic.pdf $pkgdir/usr/share/doc/$pkgname/fonts-churchslavonic.pdf
  install -Dm644 docs/fonts-churchslavonic.tex $pkgdir/usr/share/doc/$pkgname/fonts-churchslavonic.tex
  install -Dm644 *.txt LICENSE $pkgdir/usr/share/licenses/$pkgname/
}

md5sums=('9567127c1139ab8a03842aefc6962974')
