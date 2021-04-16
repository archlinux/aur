# Maintainer: Carneiro <gabriel dot chaves dot carneiro at gmail dot com>
pkgname=minlau-git
_pkgname=minlau
pkgver=1.0.1
pkgrel=2
pkgdesc="A minimalist game launcher for wine"
url="https://github.com/theRealCarneiro/minlau"
arch=('i686' 'x86_64')
license=('MIT')
depends=('wine')
makedepends=('git')
optdepends=('gamemode')
source=(
		${_pkgname}::git+${url}.git
		)
md5sums=(
'SKIP'
)

package() {
	cd $_pkgname
	DESTDIR=$pkgdir PREFIX=/usr ./setup.sh install
}
