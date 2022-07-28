# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.0.5
pkgrel=1
pkgdesc="A TUI based bluetooth manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/bluetuith"
license=('MIT')
depends=('bluez' 'dbus')
provides=('bluetuith')
conflicts=('bluetuith')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_x86_64=("d806aa453e0f1a8cac675db59d158fc193de418b6c529bf205f2160083e3dbd7")
sha256sums_i686=("ed6e30e28eeb5b5719844ca01d61194e3958b08efd422cfc8574f1b8cbe1fabc")
sha256sums_arm=("ce8b37a8a9b75f670a9e45fd1cb22a3cc2a09b02f543d526a838239e46ef8224")
sha256sums_aarch64=("5582664ab92912669fe1cb3a6d6bcc941dea557c5ebbaf6f2ac4db9ef8b2bc0f")
sha256sums_armv6h=("5916d036605a41513c9c147ad24fa5f3c7a4b0852adef6e2f43763866d25577b")
sha256sums_armv7h=("46ed1aae2e0149e4089f053341c258944d70bcc8449ae5660cd05160b2b789b2")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
