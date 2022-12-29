# Maintainer: Tiago Correia <tiagorcorreia87@gmail.com>
pkgbase="rtodo"
pkgname="rtodo-bin"
pkgver="v0.1.2"
pkgrel=1
pkgdesc="A simple To-Do list manager written in Rust"
arch=("x86_64")
url="https://github.com/TiagoRCorreia/rtodo"
license=("MIT")
makedepends=()
depends=()
source=("https://github.com/TiagoRCorreia/rtodo/releases/download/${pkgver}/rtodo.gz"
        "https://raw.githubusercontent.com/TiagoRCorreia/rtodo/main/LICENSE.md")

md5sums=('a161301836eb0e31f8d3ecb35a18e3ec'
         '9d6236041611466d09794b98fd034310')

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

	install -Dm 755 ${srcdir}/rtodo ${pkgdir}/usr/bin/rtodo
  install -Dm 644 ${srcdir}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
