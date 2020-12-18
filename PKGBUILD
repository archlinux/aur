pkgname=urxvt-tabbedex
pkgver=20.49
pkgrel=1

pkgdesc="Tabbed plugin for rxvt-unicode with many enhancements "
url='https://github.com/mina86/urxvt-tabbedex'
arch=("any")
license=("GPL")
depends=('rxvt-unicode')
install=urxvt-tabbedex.install
# https://github.com/mina86/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2
source=(https://github.com/mina86/$pkgname/archive/v$pkgver.tar.gz
        urxvt-tabbedex.install)

md5sums=('5f30c2f03d9914a9f0ffcdd9cb9b02c5'
         '6ea57fa7db9cc912b3759f1ef8c064b0')

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm644 tabbedex "$pkgdir"/usr/lib/urxvt/perl/tabbedex
}
