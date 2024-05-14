# Maintainer: Cherio <che__rio_A_T__Pro_Ton___m_ail__dot__co_m>
# New pacbro releases for Arch: https://github.com/cherio/pacbro

pkgname=pacbro
pkgver=1.0.8
pkgrel=1
pkgdesc="Package Browser for Arch, terminal multi-panel edition"
arch=('x86_64')
url="https://github.com/cherio/$pkgname"
license=('MIT')
depends=(
	'tmux'
	'base-devel'
	'fzf'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cherio/$pkgname/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('325870744f47c8408e52885ca94501b83004a6b33bca0a413dbda9f7e1e3747f')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -m755 "$pkgname-$pkgver/$pkgname.pl" "$pkgdir/usr/bin/$pkgname"
}
