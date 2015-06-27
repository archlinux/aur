# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=css-namespaces-3-docs
_version=20140320
pkgver=3.0.${_version}
pkgrel=1
pkgdesc="CSS Namespaces Module Level 3"
arch=('any')
url="http://www.w3.org/TR/css3-namespace/"
license=(custom:"W3C document license")
options=('docs' '!strip' '!libtool' '!staticlibs' '!zipman')
source=("index.html::http://www.w3.org/TR/2014/REC-css-namespaces-3-20140320/"
       "http://www.w3.org/TR/2014/REC-css-namespaces-3-20140320/default.css")
md5sums=('66760f53fbfcaa43c5bde9876e87dcc8'
         '9710de6ddde129d3f047fac200806fdf')

package() {
  cd "$srcdir"
  install -d -m 755 "$pkgdir/usr/share/doc/css-namespaces-3"
  install -m 644 index.html default.css "$pkgdir/usr/share/doc/css-namespaces-3"
}
