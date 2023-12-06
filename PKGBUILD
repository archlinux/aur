#Maintainer: Jamie Steven (gritty.water0696@fastmail.com)
_name=pixlet
pkgname=${_name}-bin
pkgver=0.29.0
pkgrel=1
arch=("x86_64" "aarch64")
pkgdesc='Build apps for pixel-based displays'
url="https://github.com/tidbyt/pixlet"
license=(APACHE)
provides=("${_name}")

source_x86_64=("https://github.com/tidbyt/pixlet/releases/download/v${pkgver}/pixlet_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/tidbyt/pixlet/releases/download/v${pkgver}/pixlet_${pkgver}_linux_arm64.tar.gz")

sha1sums_x86_64=('7d05ef3ee32ab516e609d22b6965b9b92bdd5456')
sha1sums_aarch64=('92cb16f504056db5236b5c2f13063cc44e969761')

package() {
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
