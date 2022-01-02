# Maintainer: TeaHouseLab(aka. Tsingkwai) <tsingkwai at ruzh dot top>
pkgname="harulake"
pkgver="2"
pkgrel="2"
pkgdesc="HaruLake - Help you pack a ctpkg"
arch=("x86_64")
url="https://ruzhtw.top/2022/01/02/How-to-make-a-ctpm-package"
depends=("fish")
license=("GPL-3.0 License")
provides=("harulake")
source=("https://raw.githubusercontent.com/TeaHouseLab/harulake/main/app")
sha256sums=("SKIP")
package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/app" "${pkgdir}/usr/bin/harulake"
	chmod +x "${pkgdir}/usr/bin/harulake"
	rm ../app
	}

