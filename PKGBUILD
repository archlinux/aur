# Maintainer: SwimmingTiger <hu60.cn@gmail.com>
pkgname=winegame
pkgver=0.5.10.5
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
    'gnome-desktop'
    'webkit2gtk'
    'mesa-demos'
    'python-dbus'
    'python-distro'
    'python-lxml'
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
source=("https://file.winegame.net/packages/debian/0.5.10.5/net.winegame.client_0.5.10.5_amd64.deb")
sha512sums=('f6e7b688002400a58b862270150fe2a01649b52afeaf1976fbe31f4b8c8fd1a2c363a43e51d47fc0d607db99d3c2d2c300c790e06e2449486a07038981688fdc')
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
}
