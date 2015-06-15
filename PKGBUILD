pkgname="plymouth-theme-arch-logo-new"
pkgver=0.1
pkgrel=1
pkgdesc="Replace the logo from package plymouth-theme-arch-logo"
arch=('any')
url="http://shadow.ma"
license=('GPL')
depends=('plymouth')
conflicts=('plymouth-theme-arch-logo')
replaces=('plymouth-theme-arch-logo')
options=('')
install='plymouth-arch-logo.install'
source=("plymouth-arch-logo.tar.gz"
	"plymouth-arch-logo.install")

package() {
    cd $srcdir/arch-logo
    mkdir -p $pkgdir/usr/share/plymouth/themes/arch-logo
    install -Dm644 * $pkgdir/usr/share/plymouth/themes/arch-logo
}
md5sums=('f0fd0a27e145264a89aea00b6fc87f63'
	 'd1a92e9f3b27a963009885b719b23f1f')
