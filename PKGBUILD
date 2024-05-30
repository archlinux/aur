# Maintainer: Aron Young <tkf6fkt@gmail.com>
# Maintainer: Asuka Minato
pkgname=wolfram-js-frontend-bin
pkgver=2.3.7
_ver=2.3.7
pkgrel=1
pkgdesc="Open-source Wolfram Frontend & Interpreter & Fullstack Framework written in Javascript"
arch=(x86_64)
url="https://jerryi.github.io/wljs-docs/"
license=('GPL3')
depends=(wolframengine nodejs glibc bash libuv java-runtime)
provides=(wolfram-js-frontend)
conflicts=(wolfram-js-frontend)
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/$_ver/wljs-notebook_${pkgver}_amd64.deb")
sha256sums=('9c20aaacd641537d019f3804d0a813f32c18888285ad12891ea6b4491e68ab88')

package() {
	bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
