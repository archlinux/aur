pkgname=clash-mi
_pkgname=clashmi
pkgver=1.0.15.191
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
sha256sums=("fae6a8d518ad206a9cc361e633d4b05073cbd8ad3a3e7855dcbde26549772ad1")

prepare() {
  bsdtar -xf ${_pkgname}_${pkgver}_linux_amd64.rpm
}

package() {
  cp -r usr ${pkgdir}/
}
