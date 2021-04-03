# Maintainer:geekmar <geekmar2002@gmail.com>


pkgname=winegame
pkgver=0.5.7.2
pkgrel=1
pkgdesc="开源游戏平台，帮您在deepin系统中运行windows游戏"
arch=('x86_64')
url="https://winegame.net/"
license=('GPL3')
depends=('python-gobject' 'wget' 'python-yaml' 'python-evdev' 'gtk3' 'glib2' 'psmisc' 'cabextract' 'unzip' 'p7zip' 'curl' 'xorg-xrandr' 'python-pillow' 'python-requests' 'gnome-desktop' 'webkit2gtk' 'mesa-demos' 'python-dbus' 'python-distro')
optdepends=('wine: Windows support'
            'vulkan-icd-loader: Vulkan support'
            'lib32-vulkan-icd-loader: Vulkan support'
            'vkd3d: Vulkan 3D support'
            'lib32-vkd3d: Vulkan 3D support'
            'gvfs: GVFS backend')
	source=("https://file.winegame.net/packages/debian/0.5.7.2/net.winegame.client_0.5.7.2_amd64.deb")
sha512sums=('ef7cc3c2183d51dfce9b0a2557f26a2ecf7e757a6b05e7495a2947b0a2b4968b623e63a032173c867338a17e3abea812556b48ea89840624dcc9f568035e68ad')

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
}
