# Maintainer: Cherio <che__rio_A_T__Pro_Ton___m_ail__dot__co_m>
# New pacbro releases for Arch: https://github.com/cherio/pacbro

pkgname=pacbro
pkgver=1.0.3
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
optdepends=(
	'yay: support for AUR packages'
)
provides=('pacbro')
conflicts=('pacbro')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cherio/pacbro/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('67348d8997b9c99e1413279411113945dc0a8ec1947d5af7e9642fcbeac639a3')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -m755 "$pkgname-$pkgver/pacbro.pl" "$pkgdir/usr/bin/pacbro"
}
