# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.0.3
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

sha256sums_x86_64=("865d4048bde88eb6d78fe45e8366835e7b9b8c629286a326bc52d34b9554ab1d")
sha256sums_i686=("1ea9d25504f0302bae4e0cfc25c2b2b3ad3cd46c58c7ca7bff625a0f03674701")
sha256sums_arm=("9bb4e50c4efb50ef856c2fd755b90e72f0a469c6e8bba46d16651304d9d399f1")
sha256sums_aarch64=("23f2e65f26120bd027cfd819804c91e4f3e730cb87e4e3dd1e5f3859e9befdd6")
sha256sums_armv6h=("9691ad2cc983627dd3ddd2fbfd36dd7d865348ba57e864d7369d6326e85612ce")
sha256sums_armv7h=("f59a3df41f2be06125091eb975042d0da8d3fe11d818e94a179296a0fc429dce")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
