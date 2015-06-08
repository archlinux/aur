# Contributor: Adeel Ahmad Khan <adeel2@umbc.edu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=aoeui
pkgver=1.6
pkgrel=1
pkgdesc="Lightweight and unobtrusive visual text editor optimized for Dvorak keyboard users."
arch=('i686' 'x86_64')
url="http://sites.google.com/site/aoeuiandasdfg/"
depends=('glibc')
license=('GPL2')
source=(http://aoeui.googlecode.com/files/$pkgname-$pkgver.tgz)
md5sums=('8eee06ba3cbacd4984730c2d5f17a593')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INST_DIR="$pkgdir"/usr install
}
