# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwiirc-server-bin
pkgver=1.7.0
pkgrel=2
pkgdesc="KiwiIRC server"
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://kiwiirc.com/"
_githuburl="https://github.com/kiwiirc/kiwiirc"
license=('Apache')
provides=("${pkgname%-server-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'sh')
install="${pkgname%-bin}.install"
source_armv6h=("${pkgname%-bin}-${pkgver}-armv6h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_armel.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_armhf.deb")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_arm64.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_amd64.deb")
source=("${pkgname%-bin}.install")
sha256sums=('b9aa8bb14dcdbb9dce07716df7b22e9fe9ac5ff29600be6117b1b49f22ceba9e')
sha256sums_armv6h=('e8c455f2183935cbe3e212a360ab0427287afc2c3012959aacaedbf9f48916df')
sha256sums_armv7h=('386e1e03872f51e0ec0f9db5a910fcfd99fc3877bba2ac510e83f8ef2bab19a5')
sha256sums_aarch64=('2faec14668139ac4ea370015f03c641426a56e365a3aa593f895828dc8e9385e')
sha256sums_i686=('801d39fadb72cf139206961538eeca5a974d99dc4516e90292e3c2c4769e6ebb')
sha256sums_x86_64=('7ed21d01cffc63ed2cfb403142adc667248f5d3241c00bf1dc0698cdd2e532c8')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}