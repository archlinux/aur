# Maintainer: Aron Young <tkf6fkt@gmail.com>
pkgname=wolfram-js-frontend
pkgver=0.1.5
_ver=0.9
pkgrel=1
pkgdesc="Open-source Wolfram Frontend & Interpreter & Fullstack Framework written in Javascript"
arch=(x86_64)
url="https://jerryi.github.io/wljs-docs/"
license=('GPL3')
depends=(wolframengine electron nodejs)
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/$_ver/wljs-frontend_${pkgver}_amd64.deb")
sha256sums=('c023de7903d28b15e589fe6a7138a1cafc591a0bc8a52ef1d17aeee60a1613ca')

package() {
	bsdtar -xf $srcdir/data.tar.* -C $pkgdir
}
