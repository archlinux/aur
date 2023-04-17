# Maintainer: make-github-pseudonymous-again <5165674+make-github-pseudonymous-again@users.noreply.github.com>
pkgname=ovh-api-client
pkgver=1.0.0
pkgrel=2
epoch=
pkgdesc="A bash client for OVH API"
arch=(any)
url="https://github.com/make-github-pseudonymous-again/${pkgname}"
license=()
groups=()
depends=('bash' 'coreutils' 'curl' 'jq')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/make-github-pseudonymous-again/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
