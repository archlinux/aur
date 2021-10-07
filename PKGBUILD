# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
pkgname=memoize-dash
pkgver=3.0.0
pkgrel=1
epoch=
pkgdesc="Cache executable calls"
arch=(any)
url="https://github.com/make-github-pseudonymous-again/memoize"
license=('AGPL-3.0')
groups=()
depends=('dash' 'coreutils')
makedepends=('git' 'sed')
checkdepends=()
optdepends=()
provides=('memoize')
conflicts=('memoize')
replaces=()
backup=()
options=()
install=
source=("https://github.com/make-github-pseudonymous-again/memoize/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

package() {
	cd "$srcdir/memoize-$pkgver"
	make DESTDIR="$pkgdir" install-dash
}
