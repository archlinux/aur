pkgname="urxvt-clipboard"
pkgver=2
pkgrel=2
pkgdesc="clipboard script for urxvt"
arch=("any")
depends=('rxvt-unicode' 'xsel')
conflicts=('urxvt-perls')
license=("GPL")
url='http://wiki.archlinux.org/index.php/Rxvt-unicode'
source=("clipboard" )
md5sums=('c676d897f4680b8b3420b130a2ad9784')
install="$pkgname.install"

package() {
  install -Dm644 "$srcdir"/clipboard "$pkgdir"/usr/lib/urxvt/perl/clipboard
}
