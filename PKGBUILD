# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.1.9
pkgrel=2
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

sha256sums_x86_64=("1c37bbb0c1f5e797a89bb5ddcaa906e2a47dc238e7dcf97c42945b91d7b25a13")
sha256sums_i686=("7ca8ffbb23b9153f75d39e276340d332804b1ba8b4f88f42b6201b992fd5f0a7")
sha256sums_aarch64=("896a474f6b962fe6be1b8ea0d8491f38429761f7a51d4383bb79db08a3f53040")
sha256sums_armv6h=("b24e217a302f127c83e28f08f22e9032a601a7016346e503af73157c905404fc")
sha256sums_armv7h=("b4cdeb8f654fecc88677362da7118d0a94eab57be8936831463a5243e369e84a")
sha256sums_arm=("cc75e35881181495fe41eb9e6c2702727ac43723ea89dd8b9f34e5f6afba3e20")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
