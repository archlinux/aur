# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap-bin
pkgver="0.14.4"
pkgrel=1
pkgdesc='a swiss army knife for minecraft servers (pre-compiled)'
url='https://github.com/talwat/pap'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums_i686=('9d306c8e6d3460e9b3fe07ec0eff47689faf8bc898e2767a5d848d9f263ff1ce')
sha256sums_x86_64=('693ea96dfb5cf8a54f5c741a58b76e2b9b29b9486f7184ee64f18dec5258dd29')
sha256sums_armv7h=('a23a3c8b39174b065725b4a388cc7aed4faf0a48193e9a33a5138644ae402a48')
sha256sums_armv6h=('8db98d93449293d671d9c14588963a38c39895da93087ed0efd004d278a233b3')
sha256sums_aarch64=('36c6bc36ca94ca7291384a4f1c3660f9d86f0102b1cbae16a0d8c2e5f51ee5b0')

source_x86_64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_amd64")
source_i686=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_386")
source_armv6h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv7")
source_aarch64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_arm64")

conflicts=('pap')
provides=('pap')
optdepends=('java-runtime: running the downloaded jarfiles')

package() {
  install -Dm755 pap_${pkgver}_linux_* "${pkgdir}"/usr/bin/pap
}
