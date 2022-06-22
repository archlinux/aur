# Maintainer: fearlessdots <filipebertelli@tutanota.com>

pkgname=sharik-bin
pkgver="3.1"
pkgrel="1"
pkgdesc="Sharik is an open-source, cross-platform solution for sharing files via Wi-Fi or Mobile Hotspot"
arch=('x86_64')
url="https://github.com/marchellodev/sharik"
license=('MIT')
depends=()
source=(
	"https://github.com/marchellodev/sharik/releases/download/v${pkgver}/sharik_v${pkgver}_linux.deb"
)
sha256sums=('0eacc28d2dc98e0ae9d400aa80d0df412c3b66225b8e624da047c548bb279713')

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
	chown -R root:root "$pkgdir/"
}
