# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='nsis-nsarray-bin'
_pkgname='NsArray'
_pkgname2='nsArray'
pkgver='1.1.1.7'
pkgrel='1'
pkgdesc='Plug-in for NSIS which provides dynamic, indexed and associative arrays (much like PHP)'
arch=('any')
url="https://nsis.sourceforge.io/Arrays_in_NSIS"
license=('custom')
depends=('nsis')
source=("$_pkgname-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/9/97/$_pkgname.zip")
sha256sums=('56cef303f97de3a6e26ccfe9a8a860bbb539a08c520d312e7774cce310013723')

package() {
  install -Dm644 "$srcdir/Include/$_pkgname2.nsh" "$pkgdir/usr/share/nsis/Include/$_pkgname2.nsh"
  install -Dm644 "$srcdir/Plugins/x64-ansi/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x64-ansi/$_pkgname2.dll"
  install -Dm644 "$srcdir/Plugins/x64-unicode/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x64-unicode/$_pkgname2.dll"
  install -Dm644 "$srcdir/Plugins/x86-ansi/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x86-ansi/$_pkgname2.dll"
  install -Dm644 "$srcdir/Plugins/x86-unicode/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x86-unicode/$_pkgname2.dll"
}
