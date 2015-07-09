# Maintainer: Callum Moffat <callum90ish@gmail.com>
# Modified by redneckdrow 12/6/14 3:17 PM EST
pkgname=mint-cinnamon-themes
pkgver=2014.11.18.1
pkgrel=1
pkgdesc="Linux Mint Cinnamon Themes"
arch=("any")
url="http://packages.linuxmint.com/pool/main/c/cinnamon-themes/"
license=('unknown')
source=("http://packages.linuxmint.com/pool/main/c/cinnamon-themes/cinnamon-themes_$pkgver.tar.gz")
md5sums=('9b1803487d1c408b6f95a02b8c2519dc')
 
package() {
   cd "$srcdir/cinnamon-themes"
   cp -r usr/ $pkgdir/
   chmod 755 $pkgdir/usr/share/themes/
   chmod 755 $pkgdir/usr/share/themes/*
}
