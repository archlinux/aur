# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
pkgname=android-coloredlogcat
pkgver=LATEST
pkgrel=2
pkgdesc="A python script that reformats the logcat output into a colorful stream that is much easier to visually follow."
arch=(any)
url="http://jsharkey.org/blog/2009/04/22/modifying-the-android-logcat-stream-for-full-color-debugging/"
license=('Apache')
depends=('android-sdk-platform-tools' 'python')
source=('coloredlogcat.py')
md5sums=('d034d74cf80d54cbad7b451f541de462')

package() {
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $srcdir/coloredlogcat.py $pkgdir/usr/bin
}
