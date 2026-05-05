pkgname=clash-mi
_pkgname=clashmi
pkgver=1.0.21.703
pkgrel=2
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
sha256sums=("5b37e014ede2e8d86bc642df2e5d20e467b0315b9f4776e4620ee8b594a61f21")

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}/"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/usr/share/clashmi/clashmi" "${pkgdir}/usr/bin/clashmi"
}
