# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.1.3
pkgrel=1
pkgdesc="A TUI based bluetooth manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/bluetuith"
license=('MIT')
depends=('bluez' 'dbus')
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

sha256sums_x86_64=("a5651889ed97b1411e4fda852bc66fcfcbbd1078f23036f9c531126b2f5dd445")
sha256sums_i686=("82bc3b10f65cdd9964e9a414389f54e491ffc875e34df75238c21d15edeb7999")
sha256sums_arm=("8a428a21ee77f02af2ba9341778028294b95716529207ddf431191784ff3891f")
sha256sums_aarch64=("971fe234cd5f1661a41d40b6d708e06bf14135b85812dcf6d339f6a8fe27bcd3")
sha256sums_armv6h=("0da737fb900c178a810382f3b6ee30f0b49654c01a124c88a46e5490866fb82d")
sha256sums_armv7h=("13d967334aca0d70df831878a2f7068ea19fa0b24f87f22f6c213aad94d8d66e")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
