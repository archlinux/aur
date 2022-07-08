# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.0.2
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

sha256sums_x86_64=("ad37de002ba4a27ac151134385c5b6a2034a774d9735210016005ce38f71e8f2")
sha256sums_i686=("d5f14ae80301779fdcc5f2b288a22414b29a7171664b1e54ec9e12fa996de029")
sha256sums_arm=("87ab06d32c1d8ff53baacb1c1ba77ff00a002e1fc05b7286ee888c9d55d8281d")
sha256sums_aarch64=("88a038590aaf7cc4264ffab28955d0db4896d76e0d7b121d879ee57b360fd1a9")
sha256sums_armv6h=("cc5aec73ab7eb907a0c8bd6df8f1edc06d183f5c25100bf9c26edca17b4e9c97")
sha256sums_armv7h=("48a23be76f20b05d0438dd9eb0434c530744ef28d743d3e95f33bce1dfbca725")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
