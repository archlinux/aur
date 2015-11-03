# Maintainer: NeoTheFox <soniczerops@gmail.com>
pkgname=classic95-icons
pkgver=1
pkgrel=1
pkgdesc="Classic icon set from Windows 95"
arch=('any')
url="http://sourceforge.net/projects/classic95-p/"
source=('http://downloads.sourceforge.net/project/classic95-p/Classic95.tar.gz')
noextract=()
md5sums=('88b17a2b408d793e8f63f0d0c587d4ff') 

#build() {
  #wget $source
#}

package() {
  mkdir -p "$pkgdir/usr/share/icons/"
  cp -a Classic95 "$pkgdir/usr/share/icons/"
}
