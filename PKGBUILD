# Maintainer:zzy-ac <zzy-ac@qq.com>


pkgname=winegame
pkgver=0.5.9.4
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
	source=("https://file.winegame.net/packages/debian/$pkgver/net.winegame.client_"$pkgver"_amd64.deb")
sha512sums=('d819b54abec1ae8eab421e0fa6893dcbc43231d545e51f2db036ead912d50f0fff9d12c93e8aebf52fc592b114a63a4f8488204c69130b26e9803f9c3dd7ae74')

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
}
