# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>

pkgname=recycle-cli
pkgver=1.0.0
pkgrel=1
pkgdesc='A recycle bin cli in python 3'
arch=('any')
url="https://aur.archlinux.org/packages/recycle-cli/"
license=('GPL')
depends=('coreutils' 'gettext' 'python>=3.4')
source=("Recycle.py")

sha256sums=('fa16b5f9704ab6376e95d547db14db5b465f565892e5603c4c8b615b3e97bb95')

package() {
	cd "$srcdir"
	install -Dm755 Recycle.py "$pkgdir/usr/bin/recycle"
}
