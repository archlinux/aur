# Maintainer: Manhong Dai <daimh@umich.edu>
pkgname=dirfingerprint-git
pkgver=r10.b6c7117
pkgrel=1
pkgdesc="Calculate a fingerprint for directories, recursively"
arch=('any')
url="https://github.com/daimh/dirfingerprint"
license=('GPL')
groups=()
depends=('python')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+$url.git)
noextract=()
md5sums=('SKIP') #autofill using updpkgsums
package() {
	install -Dm755 $pkgname/dirfingerprint "$pkgdir/usr/bin/dirfingerprint"
}
pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
