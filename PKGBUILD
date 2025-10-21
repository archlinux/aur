pkgname=clash-mi
_pkgname=clashmi
pkgver=1.0.11.150
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
sha256sums=("fd1246ad594b25d9d8fdaa4ecb10ecbe30b3ded81ecba8ebd89d56d5ea5f90ea")

prepare() {
  bsdtar -xf ${_pkgname}_${pkgver}_linux_amd64.rpm
}

package() {
  cp -r usr ${pkgdir}/
}