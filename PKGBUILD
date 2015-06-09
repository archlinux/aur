# Maintainer: John Lane <archlinux at jelmail dot com>
#
# Chiq font by Andrew Paglinawan

pkgname=otf-chiq
pkgver=1.0
pkgrel=1
pkgdesc='Chiq font by Andrew Paglinawan'
arch=('any')
url='http://andrewpaglinawan.com'
license=('OFL:SIL Open Font License http://opensource.org/licenses/OFL-1.1')
install='install'

source=('http://www.andrewpaglinawan.com/typeface/ChiqFamily.zip')

sha256sums=('093ee450959a5eb661af86a69501769e56107aa3a13da2d09dce23da25c59b55')

package() {
  install -dm755 $pkgdir/usr/share/fonts/OTF
  find "$srcdir" -name "*.otf" -exec install {} $pkgdir/usr/share/fonts/OTF \;
}
