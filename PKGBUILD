# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.1.2
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

sha256sums_x86_64=("b3bfa9044e5f60e38396fb9d848a9ebdd3d1583213040b1198c2c738b467d50c")
sha256sums_i686=("af411c4fe93386522a5bb8e3a073e99940322ca20215d6620cad698318a9e1d9")
sha256sums_arm=("6417de5053b0365f10c60fe4c145b9492d50708f496763380740b424d82d3a38")
sha256sums_aarch64=("1deb021fc5cfbacc8a63cf351e8efbbf3e039deaf08f90c1c401c47d0887e757")
sha256sums_armv6h=("69a39c541ff0e68aa7e2da7d2ce79af8fd4d612f3e615d7891a24679c51391a6")
sha256sums_armv7h=("97c34e2fd40f39129f9d2ff11d65ee26161ed10f87da38d65029dfbce12fb539")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
