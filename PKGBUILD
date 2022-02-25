# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.0.9
pkgrel=1
pkgdesc="A TUI based Invidious client"
arch=('x86_64')
url="https://github.com/darkhz/invidtui"
license=('MIT')
source=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=("e9b3ae0b33f1440d85aad6722c7ab6709f3fa7979a034f0677988980f7becdf2")

package() {
	install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
