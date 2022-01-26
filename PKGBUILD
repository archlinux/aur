# Maintainer: Ninni <soelder@hotmail.com>
pkgname=humble-lumpia-git
pkgver=1.0
pkgrel=5
pkgdesc="A script for managing installations of Glorious Eggroll's custom proton build "
arch=("any")
url="https://github.com/chuck-flowers/humble-lumpia"
license=("GPL3")
depends=("sh" "curl" "jq" "python" "vulkan-icd-loader")
makedepends=("git" "make" "gzip")
optdepends=("kdialog: KDE splash dialog support"
            "zenity: GNOME splash dialog support"
            "python-kivy: splash dialog support (big picture mode)"
            "steam: use proton with steam like intended"
            "lib32-vulkan-icd-loader: dxvk dependency for 32bit prefixes"
            "vulkan-driver: actually have a vulkan driver installed"
            "linux-fsync: a kernel with futex-wait-multiple support"
            "linux-zen: a kernel with futex-wait-multiple support"
            "linux-pf: a kernel with futex-wait-multiple support"
            "winetricks: protonfixes backend - highly recommended"
            "wine: support for 32bit prefixes"
            "xboxdrv: gamepad driver service"
            "python-cef: generic splash dialog support")
conflicts=("humble-lumpia")
replaces=("humble-lumpia")
source=("git+https://github.com/chuck-flowers/humble-lumpia.git")
md5sums=("SKIP")

package() {
	cd "humble-lumpia"
	make DESTDIR="$pkgdir" install
}
