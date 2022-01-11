# Maintainer: Roboron <robertoms258 at gmail dot com>

pkgname=nsis-untgz-bin
pkgver=1.0.18
pkgrel=1
pkgdesc="NSIS plugin that allows to extract the files from a tarball"
arch=('any') # Does not contain any code that's executed on the host system
url="https://nsis.sourceforge.io/UnTGZ_plug-in"
license=('custom')
depends=('nsis')
source=("Untgz-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/9/9d/Untgz.zip")
sha256sums=('3c2a088b82b27b6183ea6479d61a6c0ecc54f52e484577b641ca21867bd81a4b')


package() {
  install -D "$srcdir"/untgz/untgz.dll "$pkgdir"/usr/share/nsis/Plugins/x86-ansi/untgz.dll
  install -D "$srcdir"/untgz/unicode/untgz.dll "$pkgdir"/usr/share/nsis/Plugins/x86-unicode/untgz.dll
  install -D "$srcdir"/untgz/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
