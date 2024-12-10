# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='nsis-nsprocess-bin'
_pkgname='NsProcess'
_pkgname2='nsProcess'
pkgver='1.6.7'
pkgrel='3'
pkgdesc="$_pkgname NSIS plugin"
arch=('any')
url="https://nsis.sourceforge.io/NsProcess_plugin"
license=('custom')
depends=('nsis')
source=("$_pkgname-$pkgver.zip.7z::https://nsis.sourceforge.io/mediawiki/images/1/18/$_pkgname.zip")
sha256sums=('fc19fc66a5219a233570fafd5daeb0c9b85387b379f6df5ac8898159a57c5944')

package() {
  install -Dm644 "$srcdir/Include/$_pkgname2.nsh" "$pkgdir/usr/share/nsis/Include/$_pkgname2.nsh"
  install -Dm644 "$srcdir/Plugin/${_pkgname2}.dll" "$pkgdir/usr/share/nsis/Plugins/x86-ansi/$_pkgname2.dll"
  install -Dm644 "$srcdir/Plugin/${_pkgname2}W.dll" "$pkgdir/usr/share/nsis/Plugins/x86-unicode/${_pkgname2}.dll"
}
