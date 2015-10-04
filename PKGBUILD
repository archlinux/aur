# Maintainer: Dimitri_Wayland <dimitrischeibe@gmail.com>
pkgname=particle-browser
pkgver=0.0.1
pkgrel=1
pkgdesc="A Simple and fast Webkit based Python2 and gtk made browser"
arch=('i686' 'x86_64')
url="waylandev.tk"
license=('GPL2')
depends=('python2' 'gtk2')
options=(!emptydirs)
source=("http://waylandev.tk/aur/particle-browser.tar.xz")
md5sums=('91978c385239f9019c25af28faefe4df')

package() {
  cd "$srcdir/$pkgname"
  ./setup.sh
}
