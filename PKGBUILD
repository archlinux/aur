# Maintainer: Nathaniel Maia <natemaia10@gmail.com>

pkgname=baph
pkgver=1.72
pkgrel=1
pkgdesc="Basic AUR Package Helper"
arch=('any')
url="https://bitbucket.org/natemaia/baph"
license=('GPL')
depends=('awk' 'curl' 'sed' 'coreutils')
optdepends=(
		'git: download AUR packages via git'
		'sudo: for privilege escalation'
		'doas: for privilege escalation'
		'polkit: for privilege escalation'
		'pacman-contrib: for checkupdates'
)
source=("git+${url}.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
	cd baph/ && make DESTDIR="$pkgdir" PREFIX="/usr" install
}
