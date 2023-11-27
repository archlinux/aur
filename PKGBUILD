# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=css-namespaces-3-docs
_version=20140320
pkgver=3.0.${_version}
pkgrel=2
pkgdesc="CSS Namespaces Module Level 3"
arch=('any')
url="http://www.w3.org/TR/css3-namespace/"
license=(custom:"W3C document license")
options=('docs' '!strip' '!libtool' '!staticlibs' '!zipman')
source=("index.html::http://www.w3.org/TR/2014/REC-css-namespaces-3-20140320/"
       "http://www.w3.org/TR/2014/REC-css-namespaces-3-20140320/default.css")
sha256sums=('0ee58b6124366e81c95807810b2bba30cdca1b416ce03c4ee6a2a57792f3b8b2'
         '8ce0d2536f30edd1132fd2bd68ff835ef7149cff6046318dc7fecaae4d3da444')

package() {
  cd "$srcdir"
  install -d -m 755 "$pkgdir/usr/share/doc/css-namespaces-3"
  install -m 644 index.html default.css "$pkgdir/usr/share/doc/css-namespaces-3"
}
