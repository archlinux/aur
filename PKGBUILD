# Maintainer: Aron Young <tkf6fkt@gmail.com>
# Maintainer: Asuka Minato
pkgname=wolfram-js-frontend-bin
pkgver=2.8.5
_ver=2.8.5
pkgrel=1
pkgdesc="Open-source Wolfram Frontend & Interpreter & Fullstack Framework written in Javascript"
arch=(x86_64)
url="https://jerryi.github.io/wljs-docs/"
license=('GPL3')
depends=(wolframengine nodejs glibc bash libuv java-runtime)
provides=(wolfram-js-frontend)
conflicts=(wolfram-js-frontend)
source=("https://github.com/WLJSTeam/wolfram-js-frontend/releases/download/v${pkgver}/wljs-notebook-${pkgver}-amd64-gnulinux.deb")
sha256sums=('e36c6c44d0a71ccb0b82aa85f079ba7ed438f67353564722301ab9167d4a49f9')

package() {
	bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
