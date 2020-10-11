pkgname=urxvt-tabbedex
pkgver=20.09
pkgrel=1

pkgdesc="Tabbed plugin for rxvt-unicode with many enhancements "
url='https://github.com/mina86/urxvt-tabbedex'
arch=("any")
license=("GPL")
depends=('rxvt-unicode')
install=urxvt-tabbedex.install
source=(https://github.com/mina86/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2
        urxvt-tabbedex.install)

md5sums=('3977685b600e78142e1fcbd0c182c113'
         '6ea57fa7db9cc912b3759f1ef8c064b0')

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm644 tabbedex "$pkgdir"/usr/lib/urxvt/perl/tabbedex
}
