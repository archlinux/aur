# Maintainer: Bence Cs <bence98 at sch bme hu>

pkgname='cpan2aur2git'
pkgver='0.0.1'
pkgrel='1'
pkgdesc="CPAN2AUR wrapper"
arch=('any')
url='https://github.com/bence98/cpan2aur2git'
license=('GPL-3.0-or-later')
options=('!emptydirs')
depends=()
source=("$pkgname-$pkgver::git+https://github.com/bence98/cpan2aur2git.git#tag=v0.0.1")
md5sums=('SKIP')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
