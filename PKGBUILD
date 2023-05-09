# Maintainer: Max le Fou <buttbadger at gmail.com>

pkgname=nsis-accesscontrol-bin
pkgver=1.0.8.3
pkgrel=2
pkgdesc="NSIS plug-in that provides functions related to Windows NT ACL management."
arch=('any') # Does not contain any code that's executed on the host system
depends=('nsis')
url="https://nsis.sourceforge.io/AccessControl_plug-in"
license=('custom')
source=("AccessControl-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/4/4a/AccessControl.zip")
sha256sums=('9aa60f9c5c023fda2808af216514d8913d2673bc522d944ee771da032a1bdc10')

package() {
  install -D "$srcdir"/Plugins/i386-ansi/AccessControl.dll "$pkgdir"/usr/share/nsis/Plugins/x86-ansi/AccessControl.dll
  install -D "$srcdir"/Plugins/i386-unicode/AccessControl.dll "$pkgdir"/usr/share/nsis/Plugins/x86-unicode/AccessControl.dll
  install -D "$srcdir"/Plugins/amd64-unicode/AccessControl.dll "$pkgdir"/usr/share/nsis/Plugins/amd64-unicode/AccessControl.dll
}
