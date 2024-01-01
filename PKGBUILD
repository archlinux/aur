# Maintainer: Nik Rozman <admin[at]piskot[dot]si>
# Maintainer: Windscribe Limited <hello[at]windscribe[dot]com>
# Contributor: Nik Rozman <admin[at]piskot[dot]si>
# Contributor: Windscribe Limited <hello[at]windscribe[dot]com>

pkgname=windscribe-bin
pkgver=2.8.6
pkgrel=1
pkgdesc="Windscribe Client"
arch=('x86_64')
url="https://windscribe.com/download"
license=('GPL2')
depends=('nftables' 'c-ares' 'freetype2' 'hicolor-icon-theme' 'systemd' 'glibc>=2.28' 'glib2' 'zlib' 'gcc-libs' 'dbus' 'libglvnd' 'fontconfig' 'libx11' 'libxkbcommon' 'libxcb' 'net-tools' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'sudo' 'shadow' 'xcb-util-cursor' 'networkmanager')
conflicts=('windscribe-cli')
provides=('windscribe')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://windscribe.com/install/desktop/linux_zst_x64")
sha512sums=('SKIP')

package(){
	# Point files to the correct location
	sudo cp -R ${srcdir}/etc /
	sudo cp -R ${srcdir}/opt /
	sudo cp -R ${srcdir}/usr /
}