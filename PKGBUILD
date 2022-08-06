# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.0.6
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

sha256sums_x86_64=("1387e4a6e074205c33bf6baeae1815d9892a1c85b05fabdc640685b887967a24")
sha256sums_i686=("7d44e346401d0e50c72c47e251b867607ab74888657d90da906e89a6d6194cba")
sha256sums_arm=("5a177a348b42f91110eeb40bd9a179c2b04c7497137fbcd1e7d203a2d9e063e5")
sha256sums_aarch64=("fb2208e3c7c371e5304820538fcd1c2e033d947ecfaa431c08c898f4fcfeb76c")
sha256sums_armv6h=("b9f74ee50a64aabae243baea744fc0707284a24297f00f4739555c65543d2385")
sha256sums_armv7h=("8a630d61bf6e6f947c6df02bce740e2d91d0e22b221025fdb2ada5fc37ece31f")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
