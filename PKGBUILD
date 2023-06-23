# Maintainer: SwimmingTiger <hu60.cn@gmail.com>
# Maintainer: sunflowercx <1527981693@qq.com>

pkgname=winegame
pkgver=0.5.12.2
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
source=("https://file.winegame.net/packages/debian/0.5.12.2/net.winegame.client_0.5.12.2_amd64.deb")
sha512sums=('81d6579e51cf47db3827c02a0e778dfb49e0b95c00ee16dc31d283a1e6cfb9c558df763427bc1f3cb512d39d5c9a83bea171b59b2eb5cfacb91233d4801cc40a')
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
}
