# Maintainer: Rémi Audebert <rflah0+aur@gmail.com>
pkgname=bash-eternal-history
pkgver=1
pkgrel=1
pkgdesc="Configure bash to track all the executed commands"
arch=('any')
license=('WTFPL')
depends=('bash')
source=("$pkgname.sh")
md5sums=('fa7c811bd49ce7f5e7f2de1e36dc859f')

package() {
	install $srcdir/$pkgname.sh -D --target-directory $pkgdir/etc/profile.d/
}
