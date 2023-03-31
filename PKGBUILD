# Maintainer: blocklisted <blocklisted at protonmail dot com>
pkgname=windscribe-v2-bin
pkgver=2.6.14
pkgrel=1
pkgdesc="Windscribe GUI tool for Linux"
arch=('x86_64')
url="https://windscribe.com/guides/linux"
license=('GPL2')
depends=('nftables' 'c-ares' 'freetype2' 'hicolor-icon-theme' 'curl' 'systemd' 'glibc>=2.28')
provides=('windscribe')
conflicts=('windscribe-cli' 'windscribe')
options=('!strip')
install=windscribe-v2-bin.install
source=("https://deploy.totallyacdn.com/desktop-apps/${pkgver}/windscribe_${pkgver}_x86_64.pkg.tar.zst")
sha1sums=('e1c200528b03445406fdd9295ba524043f2cfcfa')

package() {
	mv ${srcdir}/etc ${pkgdir}
	mv ${srcdir}/opt ${pkgdir}
	mv ${srcdir}/usr ${pkgdir}
}
