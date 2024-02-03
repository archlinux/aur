# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.2.1
pkgrel=3
pkgdesc="A TUI based bluetooth manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/bluetuith"
license=('MIT')
depends=('bluez' 'bluez-obex' 'dbus')
optdepends=('networkmanager: For PANU networking'
            'modemmanager: For DUN networking'
	    'pulseaudio: For switching device audio profiles')
provides=('bluetuith')
conflicts=('bluetuith')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_aarch64=("3572e9c38f34b47646db64b067f5991b0e64d591b40ba3fc18c68d7264cf2c3d")
sha256sums_arm=("3f78ba3daa5086c57130159f55d3b8e592185dc3e1ab14a48d919baa3bc95943")
sha256sums_armv6h=("12c1f3475699ffa9b2e4459efa9be0d96f969f060ccb0db8586d98d5fbafc12b")
sha256sums_armv7h=("23862d5555f909c3614cc55dd5fed602e66b6777d3d65cc41fee726abd95b903")
sha256sums_i686=("e7cb3a0dfdadb2724c79c3a337f736c3e59c245a7e12ca5aa010a7cfc473cdcd")
sha256sums_x86_64=("3ec5cdc4f769660a891d52c3fa48ff6a875d4478c29451458436b907360e06b8")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
