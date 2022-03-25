# Maintainer: Onur BÜBER <onurbuber@engineer.com>

pkgname=plymouth-theme-archlinux
pkgver=1.1
pkgrel=1
pkgdesc="Plymouth Theme for Arch Linux (Similar to Manjaro)"
arch=('any')
url="https://github.com/onurbbr/plymouth-theme-archlinux"
license=('GPL')
depends=('plymouth')
install='plymouth-theme-archlinux.install'
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

package() {
	cd $srcdir/$repo
	install -dm755 "$pkgdir/usr/share/plymouth/themes/archlinux"
	cp -r ./plymouth-theme-archlinux/archlinux/* "$pkgdir/usr/share/plymouth/themes/archlinux"
}