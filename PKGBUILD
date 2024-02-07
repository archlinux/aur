# Maintainer: Bence Cs <bence98 at sch bme hu>

pkgname='cpan2aur2git'
pkgver='0.0.1'
pkgrel='3'
pkgdesc="CPAN2AUR wrapper"
arch=('any')
url="https://github.com/bence98/${pkgname}"
license=('GPL-3.0-or-later')
options=('!emptydirs')
depends=('perl-cpanplus-dist-arch' 'python-requests')
makedepends=('git')
optdepends=('postfix: for receiving mail for automatic processing with cpanbot-mail')
source=("git+${url}#tag=v${pkgver}")
md5sums=('SKIP')

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
