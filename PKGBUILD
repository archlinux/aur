# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='nsis-embedhtml-bin'
_pkgname='EmbedHTML'
pkgver='1.0.0.3'
pkgrel='1'
pkgdesc='Embeds an HTML document anywhere in the installer window'
arch=('any')
url="https://nsis.sourceforge.io/EmbedHTML_plug-in"
license=('custom')
depends=('nsis')
source=("$_pkgname-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/7/7c/$_pkgname.zip")
sha256sums=('f00732a93660fa71c8bfcac35e68242780262a46929274cb9182117094475a1a')

package() {
  install -Dm644 "$srcdir/Plugins/x64-ansi/$_pkgname.dll" "$pkgdir/usr/share/nsis/Plugins/x64-ansi/$_pkgname.dll"
  install -Dm644 "$srcdir/Plugins/x64-unicode/$_pkgname.dll" "$pkgdir/usr/share/nsis/Plugins/x64-unicode/$_pkgname.dll"
  install -Dm644 "$srcdir/Plugins/x86-ansi/$_pkgname.dll" "$pkgdir/usr/share/nsis/Plugins/x86-ansi/$_pkgname.dll"
  install -Dm644 "$srcdir/Plugins/x86-unicode/$_pkgname.dll" "$pkgdir/usr/share/nsis/Plugins/x86-unicode/$_pkgname.dll"
}
