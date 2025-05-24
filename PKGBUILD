# Maintainer: hotfloppy <hotfloppy . 6866 at gmail dot com>
pkgname=thunar-megasync-bin
pkgver=5.3.0
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
sha256sums=('c87b079f07514dfc14ef9db97c379cfae2ecc9fd9ee6fa97694f33e429e9df64')

package() {
	cp -R "${srcdir}/usr" "${pkgdir}/"
}
