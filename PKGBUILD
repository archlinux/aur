# Mantainer: M0Rf30
pkgname=jdk7-docs
_major=7
_minor=80
_build=b15
pkgver=${_major}.${_minor}
pkgrel=1
pkgdesc='Java SE Development Kit Documentation 7'
arch=('any')
url='http://www.oracle.com/technetwork/java/index.html'
license=('custom')
options=('docs' '!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/7u${_minor}-${_build}/jdk-7u${_minor}-docs-all.zip")
conflicts=('jdk-docs')
DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')

package(){
  mkdir -p $pkgdir/usr/share/doc/jdk7-doc/
  mv $srcdir/docs/* $pkgdir/usr/share/doc/jdk7-doc/
}

md5sums=('bd0cd35d2ffda8557577b37c9ac9c0eb')
