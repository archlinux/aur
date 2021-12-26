# Maintainer: TeaHouseLab(aka. Tsingkwai) <tsingkwai at ruzh dot top>
pkgname="ctcontainer"
pkgver="8"
pkgrel="8"
pkgdesc="A container manager which enable you to experience otherlinux distro with xorg/xwayland and pulseaudio support"
arch=("x86_64")
url="https://ruzhtw.top/pages/projects/CenterLinux/ctcontainer"
depends=("fish" "sudo" "util-linux" "xorg-xhost" "pulseaudio")
license=("GPL-3.0 License")
provides=("ctcontainer")
source=("https://cdngit.ruzhtw.top/ctcontainer/ctcontainer")
sha256sums=("SKIP")
package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/ctcontainer" "${pkgdir}/usr/bin/ctcontainer"
	chmod +x "${pkgdir}/usr/bin/ctcontainer"
	rm ../ctcontainer
	}

