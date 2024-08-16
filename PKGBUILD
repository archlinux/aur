# Maintainer: SwimmingTiger <hu60.cn@gmail.com>
# Maintainer: sunflowercx <1527981693@qq.com>

pkgname=winegame
pkgver=0.5.12.5
pkgrel=1
epoch=
pkgdesc="开源游戏平台，帮您在UOS/Linux系统中运行Windows游戏"
arch=('x86_64')
url="https://winegame.net/"
license=('GPL3')
groups=()
depends=(
    'python-gobject'
    'python-yaml'
    'python-evdev'
    'gtk3'
    'glib2'
    'psmisc'
    'cabextract'
    'unzip'
    'p7zip'
    'curl'
    'xorg-xrandr'
    'python-pillow'
    'python-requests'
    'webkit2gtk'
    'mesa-demos'
    'python-dbus'
    'python-distro'
    'python-lxml'
    'python-certifi'
)
makedepends=(
    'p7zip'
    'tar'
)
checkdepends=()
optdepends=(
    'wine: Windows support'
    'vulkan-icd-loader: Vulkan support'
    'lib32-vulkan-icd-loader: Vulkan support'
    'vkd3d: Vulkan 3D support'
    'lib32-vkd3d: Vulkan 3D support'
    'gvfs: GVFS backend'
    'gnutls: HTTPS connection kit'
    'lib32-gnutls: HTTPS connection kit for 32-bit apps'
    'samba: Get winbind to support Windows authentication'
    'zenity: Show winetricks GUI'
    'gamemode: Feral GameMode'
    'lib32-gamemode: Feral GameMode for 32-bit apps'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("https://file.winegame.net/packages/debian/0.5.12.5/net.winegame.client_0.5.12.5_amd64.deb")
sha512sums=('555e9c461db9ea49d807843a5c5f4554e6ec04ead3f67525ec65e7cc7259863276c1d3f18ff6a3cd80cc122d13bbaebddeb403392d19af161afe06ad6ab5f776')
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
}
