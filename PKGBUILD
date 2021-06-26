# Maintainer: Nathaniel Maia <natemaia10@gmail.com>

pkgname=baph
pkgver=1.1
pkgrel=2
pkgdesc="Basic AUR Package Helper"
arch=('any')
url="https://bitbucket.org/natemaia/baph"
license=('GPL')
depends=('awk' 'curl' 'sed' 'sudo' 'coreutils')
optdepends=('git: download AUR packages via git')
source=("git+${url}.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
	cd baph/ &&
		make DESTDIR="$pkgdir" PREFIX="/usr" install
}
