# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='nsis-nsjson-bin'
_pkgname='NsJSON'
_pkgname2='nsJSON'
pkgver='1.1.1.0'
pkgrel='2'
pkgdesc='A JSON (JavaScript Object Notation) parser, manipulator and generator plug-in for NSIS'
arch=('any')
url="https://nsis.sourceforge.io/NsJSON_plug-in"
license=('custom')
depends=('nsis')
source=("$_pkgname-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/f/f0/$_pkgname.zip")
sha256sums=('a3422c34509ddd67f2564d256d3284b4d3be18ee5fe21319a0fcdb4e8e2b2861')

package() {
  install -Dm644 "$srcdir/Plugins/amd64-unicode/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/amd64-unicode/$_pkgname2.dll"
  install -Dm644 "$srcdir/Plugins/x86-ansi/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x86-ansi/$_pkgname2.dll"
  install -Dm644 "$srcdir/Plugins/x86-unicode/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x86-unicode/$_pkgname2.dll"
}
