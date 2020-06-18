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

sha256sums=('20ed517f3d3f73201e31413c590434e6b72c4029b23da5f29605e753f8bc9f73')

package() {
	cd "$srcdir"
	install -Dm755 Recycle.py "$pkgdir/usr/bin/recycle"
}
