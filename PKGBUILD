# Contributor: XaBz <xabz.2k5@gmail.com>
# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=aladin
pkgver=9.0
pkgrel=1
pkgdesc="Interactive software sky atlas"
arch=('any')
url="http://aladin.u-strasbg.fr/aladin.gml"
depends=('java-environment' 'sh')
license=('GPL3')
noextract=('Aladin.jar')
source=('http://aladin.u-strasbg.fr/java/download/Aladin.jar'
        'aladin.run' 'aladin.png' 'aladin.desktop')
md5sums=('0cdc15c60fc8e9ef94383ce380c06814'
         '8f5c34afe96b4a3034806ea1b70c8c77'
         'c79258b73b96c53c98779ae7c2003f31'
         '870c25beb85eaf25f78530f52f0fac62')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java"
  #mkdir -p "$pkgdir/usr/share/aladin"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  #install -m644 "$srcdir"/Aladin/FAQ.html "$pkgdir"/usr/share/aladin
  install -m644 "$srcdir"/Aladin.jar "$pkgdir"/usr/share/java
  install -m755 "$srcdir"/aladin.run "$pkgdir"/usr/bin/aladin
  install -m755 "$srcdir"/aladin.png "$pkgdir"/usr/share/pixmaps
  install -m755 "$srcdir"/aladin.desktop "$pkgdir"/usr/share/applications
}
