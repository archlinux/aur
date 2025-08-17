# Maintainer: damir <sudo point pacman at gmail dot com>
# Contributor: feufochmar <feufochmar.gd@gmail.com>
pkgname=ttf-medievalsharp
pkgver=20200401
pkgrel=1
pkgdesc="A font based on gothic letters."
arch=('any')
url="http://openfontlibrary.org/font/medievalsharp"
license=('OFL-1.1')
depends=()
source=("https://fontlibrary.org/assets/downloads/medievalsharp/a03760934a82973ef127071373557645/medievalsharp.zip")

package() {
  cd $srcdir/Medieval\ Sharp
  install -D -m644 "SIL - Open Font License.txt" "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}
 
md5sums=('a03760934a82973ef127071373557645')
