# Maintainer: Alucryd <alucryd at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Contributor: Simon Lipp <sloonz+aur at gmail dot com>

pkgname=javahelp2
pkgver=2.0.05
pkgrel=1
pkgdesc="Java based help system"
arch=('any')
url="https://javahelp.dev.java.net/"
license=(GPL2)
depends=('java-runtime')
source=('http://download.java.net/javadesktop/javahelp/javahelp2_0_05.zip')
md5sums=('7bd68b82a1d5d8714856f661bd4d71a3')

package() {
    install -Dm644 $srcdir/jh2.0/javahelp/bin/jhindexer.jar $pkgdir/usr/share/java/javahelp/jhindexer.jar
    install -Dm644 $srcdir/jh2.0/javahelp/bin/jhsearch.jar  $pkgdir/usr/share/java/javahelp/jhsearch.jar
    install -Dm644 $srcdir/jh2.0/javahelp/lib/jh.jar $pkgdir/usr/share/java/javahelp/jh.jar
    install -Dm644 $srcdir/jh2.0/javahelp/lib/jhall.jar $pkgdir/usr/share/java/javahelp/jhall.jar
    install -Dm644 $srcdir/jh2.0/javahelp/lib/jhbasic.jar $pkgdir/usr/share/java/javahelp/jhbasic.jar
    install -Dm644 $srcdir/jh2.0/javahelp/lib/jsearch.jar $pkgdir/usr/share/java/javahelp/jsearch.jar
}
