# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>

pkgname=sigueme
pkgver=1.0
pkgrel=1
pkgdesc="Application for enhancing visual focus on people with autism spectrum disorder (warning: only in spanish language)."
arch=('i686' 'x86_64')
url="http://www.proyectosigueme.com/"
license=('unknown')
groups=()
depends=('java-runtime-headless' 'vlc')
provides=('sigueme')
conflicts=('sigueme')
source=(http://www.proyectosigueme.com/wp-content/uploads/2013/02/Sigueme.deb)
md5sums=('be82c63a48ecc0366c2b0a7bf653f59a')

build() {
  tar -xzf data.tar.gz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir"
} 
