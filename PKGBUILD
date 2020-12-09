# Maintainer:geekmar <geekmar2002@gmail.com>


pkgname=net.winegame.client
pkgver=0.5.7.1
pkgrel=1
pkgdesc="开源游戏平台，帮您在uos/deepin系统中运行windows游戏"
arch=('x86_64')
url="https://winegame.net/"
license=('GPL3')
depends=('python-gobject' 'python-yaml' 'python-evdev' 'gtk3' 'glib2' 'psmisc' 'cabextract' 'unzip' 'p7zip' 'curl' 'xorg-xrandr' 'python-pillow' 'python-requests' 'gnome-desktop' 'webkit2gtk' 'mesa-demos' 'python-dbus' 'python-distro')
optdepends=('wine: Windows support'
            'vulkan-icd-loader: Vulkan support'
            'lib32-vulkan-icd-loader: Vulkan support'
            'vkd3d: Vulkan 3D support'
            'lib32-vkd3d: Vulkan 3D support'
            'gvfs: GVFS backend')
source=("https://file.winegame.net/packages/debian/${pkgver}/net.winegame.client_${pkgver}_amd64.deb")
sha512sums=('e8732456ef2126ce2f73fa5e08212448b449e95fa02769466c3aa1e4a57f331c31dfa559757d25aa921752d060500b1d1a8ad61debea35f14768b1bd7288476f')

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
}
