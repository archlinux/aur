# Maintainer: TeaHouseLab(aka. Tsingkwai) <tsingkwai at ruzh dot top>
pkgname="ctpkg"
pkgver="31"
pkgrel="31"
pkgdesc="A bridge for different package managers , and a userland package manager included , written in progynosh(fish)"
arch=("x86_64")
url="https://ruzhtw.top/pages/projects/CenterLinux/ctpm"
depends=("fish" "sudo")
license=("GPL-3.0 License")
provides=("ctpkg")
source=("https://raw.githubusercontent.com/TeaHouseLab/ctpkg/main/app")
sha256sums=("SKIP")
package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/app" "${pkgdir}/usr/bin/ctpkg"
	chmod +x "${pkgdir}/usr/bin/ctpkg"
	rm ../app
	}

