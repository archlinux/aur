# Maintainer: Cherio <che__rio_A_T__Pro_Ton___m_ail__dot__co_m>
# New pacbro releases for Arch: https://github.com/cherio/pacbro

pkgname=pacbro
pkgver=1.0.11
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
sha256sums=('bcca6609c6ea1957b2ba570519b64cc26ab045e756521f2ea62a518843d71f4c')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -m755 "$pkgname-$pkgver/$pkgname.pl" "$pkgdir/usr/bin/$pkgname"
}
