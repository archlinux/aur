# Maintainer: Aron Young <tkf6fkt@gmail.com>
# Maintainer: Asuka Minato
pkgname=wolfram-js-frontend-bin
pkgver=2.6.0
_ver=2.6.0
pkgrel=1
pkgdesc="Open-source Wolfram Frontend & Interpreter & Fullstack Framework written in Javascript"
arch=(x86_64)
url="https://jerryi.github.io/wljs-docs/"
license=('GPL3')
depends=(wolframengine nodejs glibc bash libuv java-runtime)
provides=(wolfram-js-frontend)
conflicts=(wolfram-js-frontend)
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/$_ver/wljs-notebook-${pkgver}-amd64.deb")
sha256sums=('e0dc0b981e7f75d7dcd0840a30fa88314cd35b4a0c10485dbf8d07dc157016fd')

package() {
	bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
