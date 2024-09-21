# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='nsis-nsrichedit-bin'
_pkgname='NsRichEdit'
_pkgname2='nsRichEdit'
pkgver='1.0.0.0'
pkgrel='2'
pkgdesc='Plug-in for NSIS which provides loading of text from a file into a RichEdit control, printing of a RichEdit control and addition of a Print button to the NSIS license pages'
arch=('any')
url="https://nsis.sourceforge.io/NsRichEdit_plug-in"
license=('custom')
depends=('nsis')
source=("$_pkgname-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/e/e5/$_pkgname.zip")
sha256sums=('fb0aa2e0750d4b8ba386cdf3df98e4643f1ea7130d64c6d81573cc3bfb7c845b')

package() {
  install -Dm644 "$srcdir/Plugins/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x86-ansi/$_pkgname2.dll"
  install -Dm644 "$srcdir/Unicode/Plugins/$_pkgname2.dll" "$pkgdir/usr/share/nsis/Plugins/x86-unicode/$_pkgname2.dll"
}
