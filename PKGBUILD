pkgname=clash-mi
_pkgname=clashmi
pkgver=1.0.14.181
pkgrel=1
pkgdesc="又一款 Mihomo 核心的代理工具"
arch=("x86_64")
url="https://github.com/KaringX/clashmi/"
license=("GPL-3.0")
depends=("libkeybinder3"
        "gtk3"
        "pango"
        "gcc-libs")
source=("https://github.com/KaringX/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.rpm"
)
sha256sums=("4f331a674f66ba1b8be209a43902ffc958903daeb2cdbf02671e5777e6837af1")

prepare() {
  bsdtar -xf ${_pkgname}_${pkgver}_linux_amd64.rpm
}

package() {
  cp -r usr ${pkgdir}/
}
