# Maintainer: Noeljnuior <liamgliamgmailcom>

pkgname=pscripts
pkgver=0.1a
pkgrel=1
pkgdesc="Noeljunior's pscripts: some handy scripts for users and sysadmins"
arch=('any')
url="https://github.com/Noeljunior/pscripts"
license=('GPL')
depends=(git)
source=("$pkgname::git+https://github.com/Noeljunior/pscripts")
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname

    ./sysadmin/pscripts install "${pkgdir}/opt/$pkgname" "/opt/$pkgname" "${pkgdir}/etc/profile.d"
}
