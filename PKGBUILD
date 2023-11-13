# Maintainer: Cherio <che__rio_A_T__Pro_Ton___m_ail__dot__co_m>
# New pacbro releases for Arch: https://github.com/cherio/pacbro

pkgname=pacbro
pkgver=1.0.7
pkgrel=1
pkgdesc="Package Browser for Arch, terminal multi-panel edition"
arch=('x86_64')
url="https://github.com/cherio/pacbro"
license=('MIT')
depends=(
	'tmux'
	'base-devel'
	'fzf'
)
provides=('pacbro')
conflicts=('pacbro')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cherio/pacbro/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('218d39873d67266ed5449b73e69fdf77613b516d0052f88865f61f521f768811')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -m755 "$pkgname-$pkgver/pacbro.pl" "$pkgdir/usr/bin/pacbro"
}
