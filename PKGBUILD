#Maintainer: Jamie Steven (gritty.water0696@fastmail.com)
_name=pixlet
pkgname=${_name}-bin
pkgver=0.28.1
pkgrel=1
arch=("x86_64" "aarch64")
pkgdesc='Build apps for pixel-based displays'
url="https://github.com/tidbyt/pixlet"
license=(APACHE)
provides=("${_name}")

source_x86_64=("https://github.com/tidbyt/pixlet/releases/download/v${pkgver}/pixlet_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/tidbyt/pixlet/releases/download/v${pkgver}/pixlet_${pkgver}_linux_arm64.tar.gz")

sha1sums_x86_64=('4352853cf00c9582351932c731e3b2c9f4d5339a')
sha1sums_aarch64=('e6e205981c071b37b8bc7e3653c5266f393794b8')

package() {
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
