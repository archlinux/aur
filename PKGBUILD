# Contributor: Victor Dmitriyev <mrvvitek@gmail.com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=java-skinlf
pkgver=6.7
pkgrel=5
pkgdesc="Skinning engine for Swing"
arch=('any')
url="http://l2fprod.com/skinlf/"
license=(APACHE)
depends=('java-runtime')
#source=('https://skinlf.dev.java.net/files/documents/66/37801/skinlf-6.7-20060722.zip')
source=('https://mrwitek.github.io/aur-repo/skinlf-6.7-20060722.zip')
md5sums=('09b41b511b51e465a052483b598d68f3')
sha1sums=('9fa7a68e9d2480d120146dea60e2df74d6f1c170')
sha256sums=('3d31ffbe1fa1325049cb94e675971a2b8d89ae24558cb173e7e4e1f926dd7daa')
sha512sums=('e4df9c6a85b5bbdbd40af177595641a5ad55a5cb16e5a31217fb3f5badd25727e4b48fa78ba2374f4eb55224068807b5bd6df9fba7f2418b7b810b25cf2043b6')

package() {
  install -D --mode=644 $srcdir/skinlf-6.7/lib/skinlf.jar $pkgdir/usr/share/java/skinlf/skinlf.jar
  install -D --mode=644 $srcdir/skinlf-6.7/lib/nativeskin.jar $pkgdir/usr/share/java/skinlf/nativeskin.jar
}
