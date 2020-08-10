# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>

pkgname=recycle-cli
pkgver=2020.6.27
pkgrel=1
pkgdesc='A recycle bin cli in python 3'
arch=('any')
url="https://aur.archlinux.org/packages/recycle-cli/"
license=('GPL')
depends=('coreutils' 'gettext' 'python>=3.4')
source=("Recycle.py")

sha256sums=('5314c6d1237aa449f5925563117c9f12de8740e87654b70b419fd73772dbb5ca')

package() {
	cd "$srcdir"
	install -Dm755 Recycle.py "$pkgdir/usr/bin/recycle"
}
