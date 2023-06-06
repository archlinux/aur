# Maintainer: Tomás Pinho <me@tomaspinho.com>

pkgname=plymouth-theme-endeavouros
pkgver=1.1
pkgrel=1
pkgdesc="Plymouth Theme for EndeavourOS"
arch=('any')
url="https://github.com/tomaspinho/plymouth-endeavouros"
license=('GPL')
depends=('plymouth')
install='plymouth-theme-endeavouros.install'
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

package() {
	cd $srcdir/$repo
	install -dm755 "$pkgdir/usr/share/plymouth/themes/endeavouros"
	cp -r ./plymouth-endeavouros/* "$pkgdir/usr/share/plymouth/themes/endeavouros"
}