#Maintainer: Jamie Steven (gritty.water0696@fastmail.com)
_name=pixlet
pkgname=${_name}-bin
pkgver=0.27.1
pkgrel=1
arch=("x86_64" "aarch64")
pkgdesc='Build apps for pixel-based displays'
url="https://github.com/tidbyt/pixlet"
license=(APACHE)
provides=("${_name}")

source_x86_64=("https://github.com/tidbyt/pixlet/releases/download/v${pkgver}/pixlet_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/tidbyt/pixlet/releases/download/v${pkgver}/pixlet_${pkgver}_linux_arm64.tar.gz")

sha1sums_x86_64=('4d9d49173e6e2330c0025e53f75d8d2e102bb608')
sha1sums_aarch64=('6a75d18f1184ceaf0c11a22d7584fd92ab06bb6a')

package() {
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
