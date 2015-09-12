# Maintainer: Callum Moffat <callum90ish@gmail.com>
# Modified by redneckdrow 12/6/14 3:17 PM EST
# Modified by SerialVelocity 12/9/15 9:52 AM BST
pkgname=mint-cinnamon-themes
pkgver=2015.06.14
pkgrel=1
pkgdesc="Linux Mint Cinnamon Themes"
arch=("any")
url="http://packages.linuxmint.com/pool/main/c/cinnamon-themes/"
license=('unknown')
source=("http://packages.linuxmint.com/pool/main/c/cinnamon-themes/cinnamon-themes_$pkgver.tar.gz")
md5sums=('8a64156705fef1721803532a37b693b3')
 
package() {
   cd "$srcdir/cinnamon-themes"
   cp -r usr/ $pkgdir/
   chmod 755 $pkgdir/usr/share/themes/
   chmod 755 $pkgdir/usr/share/themes/*
}
