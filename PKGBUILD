# Contributor: Adeel Ahmad Khan <adeel2@umbc.edu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=aoeui
pkgver=1.6.98
pkgrel=2
pkgdesc="Lightweight and unobtrusive visual text editor optimized for Dvorak keyboard users."
arch=('i686' 'x86_64')
url="https://sites.google.com/site/aoeuiandasdfg/"
depends=('glibc')
makedepends=('git')
license=('GPL2')
source=(git+https://github.com/blinkkin/aoeui.git#commit=5a45ee9f710577da91c670ad1d26a87c478f3ee4)
md5sums=('SKIP')

package() {
  cd $pkgname
  make INST_DIR="$pkgdir"/usr install
}
