pkgname=clash-mi
_pkgname=clashmi
pkgver=1.0.9.137
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
sha256sums=("cd3ecbb6634daa3b3aeb301aee0dfd055a29fa50f3db3d9bf5aaf5b0eb3fd0e2")

prepare() {
  bsdtar -xf ${_pkgname}_${pkgver}_linux_amd64.rpm
}

package() {
  cp -r usr ${pkgdir}/
}