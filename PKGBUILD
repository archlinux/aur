# Maintainer: Manhong Dai <daimh@umich.edu>
pkgname=dirfingerprint
pkgver=20190119
pkgrel=1
pkgdesc="Calculate a fingerprint for directories, recursively"
arch=('any')
url="https://github.com/daimh/dirfingerprint"
license=('GPL')
groups=()
depends=('python')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=($pkgname-$pkgver.tar.gz)
source=($pkgname::git+$url.git)
noextract=()
md5sums=('SKIP') #autofill using updpkgsums
package() {
	install -Dm755 dirfingerprint/dirfingerprint "$pkgdir/usr/bin/dirfingerprint"
}
