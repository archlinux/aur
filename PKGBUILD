# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=xhtml-modularization-1-docs
_version=20100729
pkgver=1.1.${_version}
pkgrel=1
pkgdesc="XHTML Modularization Documentation"
arch=('any')
url="http://www.w3.org/TR/xhtml-modularization/"
license=('W3C')
options=('docs' '!strip')
source=("http://www.w3.org/TR/2010/REC-xhtml-modularization-${_version}/xhtml-modularization.tgz")
md5sums=('cf4cadea4da93d20f9689fc468a80e2f')
replaces=('xhtml-modularization-docs')

package(){
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/doc"
  cp -rf "xhtml-modularization-${_version}" "$pkgdir/usr/share/doc/xhtml-modularization-1"
}
