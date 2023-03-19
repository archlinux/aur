# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap-bin
pkgver="0.14.1"
pkgrel=1
pkgdesc='a swiss army knife for minecraft servers (pre-compiled)'
url='https://github.com/talwat/pap'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums_i686=('3a80f4c132273f347e551fb3fbc229ae7f66eb31ff838cb9ee09943bcda57831')
sha256sums_x86_64=('136c6c1a66f8db87aec4c134e2bc40e4b8abb5b61525c578caac2459663b4ed0')
sha256sums_armv7h=('0fb1753eb8de1457737e0f6392d9f363ced88bd8222590990bf66abb60d2ea9f')
sha256sums_armv6h=('88fa6ece21301e685141c48e7cbbb8453fefd36ce48b56e536cef0265457d062')
sha256sums_aarch64=('244f3bb9bf7f4f01b533ce7b84c84cb0adc89e890d0c2155dc9eebaa990676de')

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
