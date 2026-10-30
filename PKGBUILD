# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='nsis-nsprocess-bin'
_pkgname='NsProcess'
_pkgname2='nsProcess'
pkgver='1.7'
pkgrel='1'
pkgdesc="$_pkgname NSIS plugin"
arch=('any')
url="https://nsis.sourceforge.io/NsProcess_plugin"
license=('custom')
depends=('nsis')
source=("$_pkgname-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/1/18/$_pkgname.zip")
sha256sums=('30d7b4188280a01dd227e07373723a1ec6b1b3206d305fc4a2ec2691046f04e3')

package() {
  install -Dm644 "$srcdir/Include/$_pkgname2.nsh" "$pkgdir/usr/share/nsis/Include/$_pkgname2.nsh"
  install -Dm644 "$srcdir/Plugin/x64/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/amd64-ansi/$_pkgname2.dll"
  install -Dm644 "$srcdir/Plugin/x64/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/amd64-unicode/$_pkgname2.dll"
  install -Dm644 "$srcdir/Plugin/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x86-ansi/$_pkgname2.dll"
  install -Dm644 "$srcdir/Plugin/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x86-unicode/$_pkgname2.dll"
}
