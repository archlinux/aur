# Maintainer: TeaHouseLab(aka. Tsingkwai) <tsingkwai at ruzh dot top>
pkgname="progynosh"
pkgver="6"
pkgrel="6"
pkgdesc="A dev manager for dev fish shell script eaiser"
arch=("x86_64")
url="https://ruzhtw.top/pages/projects/progynosh"
depends=("fish" "sudo")
license=("GPL-3.0 License")
provides=("progynosh")
source=("https://raw.githubusercontent.com/happyeggchen/Progynosh/main/progynosh")
sha256sums=("SKIP")
package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/progynosh" "${pkgdir}/usr/bin/progynosh"
	chmod +x "${pkgdir}/usr/bin/progynosh"
	rm ../progynosh
	}

