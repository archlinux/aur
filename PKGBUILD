# Maintainer: TeaHouseLab(aka. Tsingkwai) <tsingkwai at ruzh dot top>
pkgname="ctpkg"
pkgver="55"
pkgrel="3"
pkgdesc="A bridge for different package managers , and a userland package manager included , written in progynosh(fish)"
arch=("x86_64")
url="https://ruzhtw.top/pages/projects/CenterLinux/CTPM"
depends=("fish" "sudo")
license=("GPL-3.0 License")
provides=("ctpkg")
source=("https://cdngit.ruzhtw.top/pkghub/ctpkg")
sha256sums=("SKIP")
install='hooks.install'
package() {
	install -m755 -D "${srcdir}/ctpkg" "${pkgdir}/usr/bin"
	}

