# Maintainer: Cherio <che__rio_A_T__Pro_Ton___m_ail__dot__co_m>
# New pacbro releases for Arch: https://github.com/cherio/pacbro

pkgname=pacbro
pkgver=1.0.2
pkgrel=3
pkgdesc="Package Browser for Arch, terminal multi-panel edition"
arch=('x86_64')
url="https://github.com/cherio/pacbro"
license=('MIT')
depends=(
	'perl'
	'tmux'
	'fzf'
	'pacman'
	'bash'
	'coreutils'
)
optdepends=(
	'yay: support for AUR packages'
)
provides=('pacbro')
conflicts=('pacbro')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cherio/pacbro/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('3da2e429cfc481e7dd5029e71b077501574ccddcaaf32bdcebf11a6a1cf2df20c5909e93dd7812cc1f01506cbd54848ad6c1ea3a0a61dfbb1c47250ea18ccb44')

package() {
	echo "PWD: $(pwd) : $(ls -A)"
	echo "PKG: $pkgdir : $(ls -A $pkgdir)"
	echo "SRC: $srcdir : $(ls -A $srcdir/$pkgname-$pkgver)"
	mkdir -p "$pkgdir/usr/bin"
	install -m755 "$pkgname-$pkgver/pacbro.pl" "$pkgdir/usr/bin/pacbro"
}
