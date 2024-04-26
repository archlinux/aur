# Maintainer: Aron Young <tkf6fkt@gmail.com>
pkgname=wolfram-js-frontend-bin
pkgver=2.3.2
_ver=2.3.2
pkgrel=1
pkgdesc="Open-source Wolfram Frontend & Interpreter & Fullstack Framework written in Javascript"
arch=(x86_64)
url="https://jerryi.github.io/wljs-docs/"
license=('GPL3')
depends=(wolframengine nodejs glibc bash libuv java-runtime)
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/$_ver/wljs-notebook_${pkgver}_amd64.deb")
sha256sums=('4cfe5d3f85fbb4d1d900736bedca7117f5a3d7abca32e363c6c9b21b1493006a')

package() {
	bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
