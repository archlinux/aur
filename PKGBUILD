# Maintainer: Aron Young <tkf6fkt@gmail.com>
pkgname=wolfram-js-frontend-bin
pkgver=0.2.9
_ver=0.9.8
pkgrel=1
pkgdesc="Open-source Wolfram Frontend & Interpreter & Fullstack Framework written in Javascript"
arch=(x86_64)
url="https://jerryi.github.io/wljs-docs/"
license=('GPL3')
depends=(wolframengine nodejs)
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/$_ver/wljs-frontend_${pkgver}_amd64.deb")
sha256sums=('727695f69d20541b831b51942fb8e80473b5aee83f1152e234d94c8062e55bae')

package() {
	bsdtar -xf $srcdir/data.tar.* -C $pkgdir
}
