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

sha256sums=('514cde5546f3ab96c576a1eb757e2071b81e7234a7ebd0aad9fdb6c1147f85b7')

package() {
	cd "$srcdir"
	install -Dm755 Recycle.py "$pkgdir/usr/bin/recycle"
}
