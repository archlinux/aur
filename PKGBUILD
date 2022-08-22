pkgname=urxvt-tabbedex
pkgver=22.32
pkgrel=1

pkgdesc="Tabbed plugin for rxvt-unicode with many enhancements "
url='https://github.com/mina86/urxvt-tabbedex'
arch=("any")
license=("GPL")
depends=('rxvt-unicode')
install=urxvt-tabbedex.install 
# https://github.com/mina86/$pkgname/archive/v$pkgver.tar.gz
source=(https://github.com/mina86/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2
        urxvt-tabbedex.install)

md5sums=('5eb46faeed39fb906b37838b1dc47125'
         '6ea57fa7db9cc912b3759f1ef8c064b0')

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm644 tabbedex "$pkgdir"/usr/lib/urxvt/perl/tabbedex
}
