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
sha256sums=('520eb0861165f634c4aadadf940da48244e8a4a2b23837655d7ea832940706b5')

package() {
	bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
