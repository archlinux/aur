pkgname=plymouth-theme-antergos
pkgver=1
pkgrel=1
pkgdesc="Antergos Plymouth Theme"
arch=('any')
license=('unknown')
depends=('plymouth')
source=('https://github.com/Antergos/antergos-packages/raw/master/plymouth/antergos.zip')
md5sums=('4ded1b5deede3b82b5375141f5c580be')

package() {
	install -dDm 755 $pkgdir/usr/share/plymouth/themes/
	mv $srcdir/antergos $pkgdir/usr/share/plymouth/themes/antergos	
}
