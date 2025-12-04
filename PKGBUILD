# Maintainer: Andrey Vazhenin
pkgname=windscribe-no-systemd
pkgver=2.18.8
pkgrel=2
pkgdesc="Windscribe GUI tool for Linux"
arch=('x86_64')
url="https://windscribe.com/guides/linux"
license=('GPL2')
depends=('nftables' 'c-ares' 'freetype2' 'hicolor-icon-theme' 'glibc>=2.28' 'glib2' 'zlib' 'gcc-libs' 'dbus' 'libglvnd' 'fontconfig' 'libx11' 'libxkbcommon' 'libxcb' 'net-tools' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'sudo' 'shadow')
provides=('windscribe')
conflicts=('windscribe-cli' 'windscribe')
options=('!strip')
install=windscribe-no-systemd.install
source=("https://deploy.totallyacdn.com/desktop-apps/${pkgver}/windscribe_${pkgver}_amd64.pkg.tar.zst")
sha1sums=('f2163eeb67afb807dd841e06e67e807ccf1543c6')

package() {
	mv ${srcdir}/etc ${pkgdir}
	mv ${srcdir}/opt ${pkgdir}
	mv ${srcdir}/usr ${pkgdir}
}
