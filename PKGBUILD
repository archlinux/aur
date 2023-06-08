# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwiirc-server-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="KiwiIRC server"
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://kiwiirc.com/"
_githuburl="https://github.com/kiwiirc/kiwiirc"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage" "kiwiirc")
depends=('glibc' 'sh')
install="${pkgname%-bin}.install"
source_armv6h=("${pkgname%-bin}-${pkgver}-armv6h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_armel.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_armhf.deb")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_arm64.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_amd64.deb")
source=("${pkgname%-bin}.install")
sha256sums=('b9aa8bb14dcdbb9dce07716df7b22e9fe9ac5ff29600be6117b1b49f22ceba9e')
sha256sums_armv6h=('6e61b0e09cad8434810e83810a9d8e20b052c678495a76aba4119e6751beaf92')
sha256sums_armv7h=('94b8e670e10c481dba46aadbdbfd7e9d92ce9c08dbe113e171327e5ba1b8791a')
sha256sums_aarch64=('4a2ffd2dc53404a0f875333af10c6c24514532e0ffee95104551d8d3f4e2b2b0')
sha256sums_i686=('fe062a82d57d71e25fd5f23eb0473f92e454b27d22e8a326e98b5dd8d957a4e5')
sha256sums_x86_64=('de6bb7363523ebfaa61c853c6a64e73c5a3b0df204c757aaaaf3ca79ba7e12d1')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}