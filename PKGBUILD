# Maintainer: hotfloppy <hotfloppy . 6866 at gmail dot com>
pkgname=thunar-megasync-bin
pkgver=5.2.0
pkgrel=1
pkgdesc="Managing your MEGA cloud drive using Thunar file manager."
arch=('x86_64')
url="https://mega.nz"
license=('custom')
provides=("thunar-megasync=$pkgver")
conflicts=('thunar-megasync' 'thunar-gtk3-megasync')
replaces=("thunar-megasync")
depends=('megasync-bin' 'thunar')
source=("${url}/linux/repo/Arch_Extra/x86_64/thunar-megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('3c3e8bc9a793881c92aee9e937263218b13c2bbc4ed0d2714272466325284cb9')

package() {
	cp -R "${srcdir}/usr" "${pkgdir}/"
}
