# Maintainer: Aron Young <tkf6fkt@gmail.com>
# Maintainer: Asuka Minato
pkgname=wolfram-js-frontend-bin
pkgver=2.5.0
_ver=2.5.0
pkgrel=1
pkgdesc="Open-source Wolfram Frontend & Interpreter & Fullstack Framework written in Javascript"
arch=(x86_64)
url="https://jerryi.github.io/wljs-docs/"
license=('GPL3')
depends=(wolframengine nodejs glibc bash libuv java-runtime)
provides=(wolfram-js-frontend)
conflicts=(wolfram-js-frontend)
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/$_ver/wljs-notebook_${pkgver}_amd64.deb")
sha256sums=('4c4ae42175f53a28f4029d819a7f033ef53652cc96ff719a8ec06ebe1ff22fb3')

package() {
	bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
