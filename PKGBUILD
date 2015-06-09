# Maintainer: hax404 <hax404fooaurblinkenlib@hax404.de>
pkgname=blinkenlib
pkgver=0.7.4
pkgrel=1
pkgdesc="C library to mess with LED projects and Blinken-houses"
arch=('i686' 'x86_64')
url="http://wiki.blinkenarea.org/index.php/BlinkenLibEnglish"
license=('GPL')
source=("git+http://git.blinkenarea.org/projects/BlinkenLib#tag=v${pkgver}")
sha256sums=(SKIP) #autofill using updpkgsums

build() {
  cd "BlinkenLib"

  make
}

package() {
  cd "BlinkenLib"

  make DEF_PREFIX="$pkgdir/usr" install
}

