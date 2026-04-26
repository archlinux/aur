pkgname=clash-mi
_pkgname=clashmi
pkgver=1.0.21.703
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
sha256sums=("78f759d4f52f376c0f41a23b8f702a373d4dd197390bbd1a92ed3b04f12ab93c")

prepare() {
  bsdtar -xf ${_pkgname}_${pkgver}_linux_amd64.rpm
}

package() {
  cp -r usr ${pkgdir}/
}
