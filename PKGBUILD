# Maintainer: Rellieberman <name AT gmail DOT com>
pkgname=bulky
pkgver=1.6
pkgrel=1
pkgdesc="Bulk File Renamer"
arch=("i686" "x86_64")
url="https://github.com/linuxmint/bulky"
licence=("GPL3")
depends=('python-magic' 'xapp' 'python-xapp')
_zipname=60ae5bd5c529c030e65ad12cbfc2c7046a978a8a
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_zipname}.tar.gz")
sha256sums=('303dabe088f187f24fd045305980c14e8f1f17848e566ddb8f0c6e514d7e88d1')

package()
{

    install -d "$pkgdir"/usr/share/bulky
    install -d "$pkgdir"/usr/lib/bulky
  
  
  
    install -Dm644 "$srcdir"/"$pkgname"-"$_zipname"/usr/share/bulky/bulky.css -t "$pkgdir"/usr/share/bulky
    install -Dm644 "$srcdir"/"$pkgname"-"$_zipname"/usr/share/bulky/bulky.ui -t "$pkgdir"/usr/share/bulky
  
    install -Dm644 "$srcdir"/"$pkgname"-"$_zipname"/usr/share/glib-2.0/schemas/org.x.bulky.gschema.xml -t "$pkgdir"/usr/share/glib-2.0/schemas
    install -Dm644 "$srcdir"/"$pkgname"-"$_zipname"/usr/share/bulky/bulky.ui -t "$pkgdir"/usr/share/bulky
    
    install -Dm644 "$srcdir"/"$pkgname"-"$_zipname"/usr/share/icons/hicolor/scalable/apps/bulky.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps
    
    install -Dm644 "$srcdir"/"$pkgname"-"$_zipname"/usr/lib/bulky/bulky.py -t "$pkgdir"/usr/lib/bulky
    install -Dm644 "$srcdir"/"$pkgname"-"$_zipname"/usr/bin/bulky -t "$pkgdir"/usr/bin
   
    chmod 755  "$pkgdir"/usr/lib/bulky/bulky.py
    chmod 755  "$pkgdir"/usr/bin/bulky
    
    install -Dm644 "$srcdir"/"$pkgname"-"$_zipname"/usr/share/applications/bulky.desktop -t "$pkgdir"/usr/share/applications

}
