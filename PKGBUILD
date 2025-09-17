pkgname=clash-mi
pkgver=1.0.9.132
pkgrel=1
pkgdesc="又一款 Mihomo 核心的代理工具"
arch=("x86_64")
url="https://github.com/KaringX/clashmi/"
license=("GPL-3.0")
depends=("libkeybinder3"
        "gtk3"
        "pango"
        "gcc-libs")
source=("https://github.com/KaringX/clashmi/releases/download/v1.0.9.132/clashmi_1.0.9.132_linux_amd64.rpm"
)
sha256sums=("62b3a4291419561cbdb5a9e2612dd2390c8a283639e8a1cebcf98f70d4b11fd8")

prepare() {
  bsdtar -xf clashmi_${pkgver}_linux_amd64.rpm
}

package() {
  cp -r usr ${pkgdir}/
}
