# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=html-4-docs
pkgver=4.01.19991224
pkgrel=1
pkgdesc="HTML 4.01 Specification"
arch=('any')
url="http://www.w3.org/TR/html4/"
license=('W3C')
options=('docs')
source=("http://www.w3.org/TR/1999/REC-html401-19991224/html40.tgz")
md5sums=('1ed76627ba80816079649f67023ec7ab')
noextract=("html40.tgz")
replaces=('html4-doc')

build() {
  cd "$srcdir"
  mkdir -p html-4
  cd html-4
  tar xaf ../html40.tgz
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/doc"
  cp -rf html-4 "$pkgdir/usr/share/doc"
}
