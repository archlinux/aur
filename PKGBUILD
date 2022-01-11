# Maintainer: Roboron <robertoms258 at gmail dot com>

pkgname=nsis-inetc-bin
pkgver=1.0.5.3
pkgrel=1
pkgdesc="Internet client plug-in for files download and upload."
arch=('any') # Does not contain any code that's executed on the host system
url="https://nsis.sourceforge.io/Inetc_plug-in"
license=('custom')
depends=('nsis')
source=("Inetc-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/c/c9/Inetc.zip")
sha256sums=('88d9dcffbe967df6ee9f5820f8199a673383e581bf650dbc35b94846314b1a4b')

package() {
  install -D "$srcdir"/Plugins/x86-ansi/INetC.dll "$pkgdir"/usr/share/nsis/Plugins/x86-ansi/INetC.dll
  install -D "$srcdir"/Plugins/x86-unicode/INetC.dll "$pkgdir"/usr/share/nsis/Plugins/x86-unicode/INetC.dll
}
