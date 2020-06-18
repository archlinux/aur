# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>

pkgname=recycle-cli
pkgver=1.1
pkgrel=1
pkgdesc='A recycle bin cli in python 3'
arch=('any')
url="https://aur.archlinux.org/packages/recycle-cli/"
license=('GPL')
depends=('coreutils' 'gettext' 'python>=3.4')
source=("Recycle.py")

md5sums=('4ad5337338eeff9f0e0429c151faaad6')

package() {
	cd "$srcdir"
	install -Dm755 Recycle.py "$pkgdir/usr/bin/recycle"
}
