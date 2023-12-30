# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.2.0
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

sha256sums_aarch64=("dc5d8fec108177f41032b223e008a35abd21aa6189749a6d35cc41da3837c512")
sha256sums_arm=("9c37df1446a6c17a4aa286f71d03b51e5138bfc7b89dd92a42cd17536ff436a7")
sha256sums_armv6h=("6f963fe5cc73ec371bdfc399b711b8aea4522a6393e6b51e9c46c3d1a9480e40")
sha256sums_armv7h=("9ee651cc59732e2741fe77a51d5ccc9c9e6f424785821316108ad700d5009949")
sha256sums_i686=("b54b0d515bd68f62e8482936dae9dc315dd9a7b033ffb2630ba1850005d2fa7c")
sha256sums_x86_64=("1cbd29494cae8f5beb3248949889e921e2db433d924df980f7330c3b9543a0d8")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
