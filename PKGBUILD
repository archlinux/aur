#Maintainer: Jamie Steven (gritty.water0696@fastmail.com)
_name=pixlet
pkgname=${_name}-bin
pkgver=0.32.2
pkgrel=1
arch=("x86_64" "aarch64")
pkgdesc='Build apps for pixel-based displays'
url="https://github.com/tidbyt/pixlet"
license=(APACHE)
provides=("${_name}")

source_x86_64=("https://github.com/tidbyt/pixlet/releases/download/v${pkgver}/pixlet_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/tidbyt/pixlet/releases/download/v${pkgver}/pixlet_${pkgver}_linux_arm64.tar.gz")

sha1sums_x86_64=('cef8aec45063a86c2603067099706b0668e9e5b4')
sha1sums_aarch64=('40813ee9b6f9e3cb6c913d7a11cc4b5ab3559ddf')

package() {
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
