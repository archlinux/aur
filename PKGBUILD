# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='nsis-registry-bin'
_pkgname='Registry'
_pkgname2='registry'
pkgver='4.2'
pkgrel='1'
pkgdesc='NSIS plug-in for registry'
arch=('any')
url="https://nsis.sourceforge.io/Registry_plug-in"
license=('custom')
depends=('nsis')
source=("$_pkgname-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/4/47/$_pkgname.zip")
sha256sums=('791451f1be34ea1ed6f2ad6d205cf8e54bb0562af11b0160a6bfa5f499624094')

package() {
  install -Dm644 "$srcdir/Desktop/Include/$_pkgname.nsh" "$pkgdir/usr/share/nsis/Include/$_pkgname.nsh"
  install -Dm644 "$srcdir/Desktop/Plugin/x64/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x64-ansi/$_pkgname2.dll"
  install -Dm644 "$srcdir/Desktop/Plugin/x64/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x64-unicode/$_pkgname2.dll"
  install -Dm644 "$srcdir/Desktop/Plugin/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x86-ansi/$_pkgname2.dll"
  install -Dm644 "$srcdir/Desktop/Plugin/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x86-unicode/$_pkgname2.dll"
}
