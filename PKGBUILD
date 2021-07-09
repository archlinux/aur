# Maintainer: Rellieberman <name AT gmail DOT com>
pkgname=bulky
pkgver=1.7
pkgrel=1
pkgdesc="Bulk File Renamer"
arch=("i686" "x86_64")
url="https://github.com/linuxmint/bulky"
licence=("GPL3")
depends=('python-magic' 'xapp' 'python-xapp')
_zipname=e47e47fdab3c466e7a1856b7fc379ef704ad1b49
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_zipname}.tar.gz")
sha256sums=('d18c296dc8a18af88f98e1bde9eea5f24a6dd5690f4cb2d40bf7b3dc55128b53')

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
