# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.1.7
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

sha256sums_armv6h=("24ebf34afe94adfb8258f83ff7d446cf531cc03141f019b09689eaf3e58c081e")
sha256sums_aarch64=("3b28c060d95ad94e5f4bae6605893f87625e3456b90839e6016c41e9327ebc6f")
sha256sums_arm=("75c2d151136374b0dac8b9291dfc65687a662f6e0fa15a2ffb4906e0dfa57122")
sha256sums_armv7h=("8d31a9b13b1791745ad6fee2d31df396863353f248ff3a2854b6930191e00af7")
sha256sums_i686=("92c93c3c35f725bd95e94d475b55db7c07f770868f2aa62961680d0b27b2c0a4")
sha256sums_x86_64=("ecdaaeef565eb1cbd7da9bbc19efb98df7b7168c9d24383aa357ec1da66b658d")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
