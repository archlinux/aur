# Maintainer: Cherio <che__rio_A_T__Pro_Ton___m_ail__dot__co_m>
# New pacbro releases for Arch: https://github.com/cherio/pacbro

pkgname=pacbro
pkgver=1.0.5
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
sha256sums=('04da24b523d82b7849009fffce587a9d50ff9632f550c0674303d76d74daae88')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -m755 "$pkgname-$pkgver/pacbro.pl" "$pkgdir/usr/bin/pacbro"
}
