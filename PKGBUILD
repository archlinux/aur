# Maintainer: Roboron <robertoms258 at gmail dot com>

pkgname=nsis-cabx-bin
pkgver=1.0
pkgrel=1
pkgdesc="NSIS plugin which allows you to extract .cab files"
arch=('any') # Does not contain any code that's executed on the host system
url="https://nsis.sourceforge.io/CabX_plug-in"
license=('custom')
depends=('nsis')
source=("CabX-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/c/c7/CabX.zip")
sha256sums=('5c42e0af34bc29d61dc8d84cb74f3e541e1133f9d35f147792e424503abd1fe6')

package() {
  install -D "$srcdir"/Plugins/x86-unicode/CabX.dll "$pkgdir"/usr/share/nsis/Plugins/x86-unicode/CabX.dll
}
