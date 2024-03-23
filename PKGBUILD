# Maintainer: Aron Young <tkf6fkt@gmail.com>
pkgname=wolfram-js-frontend-bin
pkgver=2.2.2
_ver=2.0.0
pkgrel=1
pkgdesc="Open-source Wolfram Frontend & Interpreter & Fullstack Framework written in Javascript"
arch=(x86_64)
url="https://jerryi.github.io/wljs-docs/"
license=('GPL3')
depends=(wolframengine nodejs glibc bash libuv java-runtime)
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/$_ver/wljs-notebook_${pkgver}_amd64.deb")
sha256sums=('528431b7b84b5c32d02a4c862594eb43d0dc2871ac9664728831bd574b6fc989')

package() {
	bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
