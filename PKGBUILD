pkgname=clash-mi
_pkgname=clashmi
pkgver=1.0.22.802
pkgrel=1
pkgdesc="又一款 Mihomo 核心的代理工具"
arch=("x86_64")
url="https://github.com/KaringX/clashmi/"
license=("GPL-3.0-only")
depends=("gcc-libs"
        "gtk3"
        "hicolor-icon-theme"
        "libayatana-appindicator"
        "libkeybinder3"
        "libsecret")
source=("https://github.com/KaringX/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb"
)
sha256sums=("54cba2d9e375033f80f18abc32a66244eb1e5cd8aa02ed84633733479566dceb")

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}/"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/usr/share/clashmi/clashmi" "${pkgdir}/usr/bin/clashmi"
}
