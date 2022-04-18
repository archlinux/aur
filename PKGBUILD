#Maintainer: Chloe Stars <c.stars at icloud dot com>

pkgname=plymouth-theme-dotlock
pkgver=1.1
pkgrel=1
pkgdesc="A simple plymouth theme with two-step module."
arch=('any')
url="https://github.com/vikashraghavan/dotLock"
license=('custom')
depends=('plymouth')

install='plymouth-theme-dotlock.install'
source=("dotLock.tar.xz::$url/releases/download/v$pkgver/dotLock.tar.xz"
        'plymouth-theme-dotlock.install')
md5sums=('e9611fcaf1813d7f18c344401be993e6' 
         'bcccf5eab07c8258a43127b55981e6c6')

package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/plymouth/themes/dotLock
    install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/dotLock
}
