# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jvlt
pkgver=1.3.3
_pkgver=`date +%Y%m%d`
pkgrel=1
pkgdesc="A vocabulary learning tool with quizzes using flash cards similar to the Leitner system"
arch=('any')
url="http://jvlt.sourceforge.net"
license=('GPL')
depends=('java-environment')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.jar \
        http://jvlt.sourceforge.net/jvlt.png $pkgname.sh $pkgname.desktop)
md5sums=('e880ff05b7c6b089ef01580f1aab6892'
         '7f038c40100906d1058714dd76381165'
         'f04116276afcc092916e0cd749e036e7'
         'c656f737f05b858461c89368279eb1a8')

package() {
  install -D -m644 $pkgname-$pkgver.jar \
      "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar 
  install -D -m755 $srcdir/$pkgname.sh "$pkgdir"/usr/bin/$pkgname 
  install -D -m644 jvlt.png "$pkgdir"/usr/share/pixmaps/jvlt.png  
  install -D -m644  $srcdir/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop 
}
