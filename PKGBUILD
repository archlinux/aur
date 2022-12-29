# Maintainer: Tiago Correia <tiagorcorreia87@gmail.com>
pkgname="rtodo"
pkgver="v0.1.1"
pkgrel=1
pkgdesc="A simple To-Do list manager written in Rust"
arch=("x86_64")
url="https://github.com/TiagoRCorreia/rtodo"
license=("MIT")
makedepends=()
source=("https://github.com/TiagoRCorreia/rtodo/releases/download/${pkgver}/rtodo.gz"
        "https://raw.githubusercontent.com/TiagoRCorreia/rtodo/main/LICENSE.md")

md5sums=('65212c3174f5a3ebebfcda045d687a76'
         '9d6236041611466d09794b98fd034310')

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

	install -Dm 755 ${srcdir}/rtodo ${pkgdir}/usr/bin/rtodo
  install -Dm 644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
