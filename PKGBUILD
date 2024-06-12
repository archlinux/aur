# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='nsis-nsisxml-bin'
_pkgname='nsisXML'
pkgver='1.4'
pkgrel='1'
pkgdesc='Small NSIS plugin to manipulate XML data through MSXML'
arch=('any')
url="http://wiz0u.free.fr/prog/nsisXML"
license=('custom')
depends=('nsis')
source=("$_pkgname-$pkgver.zip::http://wiz0u.free.fr/prog/$_pkgname/latest.php")
sha256sums=('42a6c3bb29bab5754df7715bc739ba6011c31d7dbaf9e1d4be2df06dea504f31')

package() {
  install -Dm644 "$srcdir/bin/$_pkgname.dll" "$pkgdir/usr/share/nsis/Plugins/x86-ansi/$_pkgname.dll"
  install -Dm644 "$srcdir/binU/$_pkgname.dll" "$pkgdir/usr/share/nsis/Plugins/x86-unicode/$_pkgname.dll"
  install -Dm644 "$srcdir/$_pkgname/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
