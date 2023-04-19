# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap-bin
pkgver="0.15.0"
pkgrel=1
pkgdesc='a swiss army knife for minecraft servers (pre-compiled)'
url='https://github.com/talwat/pap'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums_i686=('6be70701549ae9e84a6078c69f24297ad2d3dfe4183eec52c2895b193ba5d83c')
sha256sums_x86_64=('50174896aa0679f774be0697d0aec6688ebc7082cd154135b6c0b8c593125c2c')
sha256sums_armv7h=('51e9c7db4df4fc38670984eb3c4349eb740c91a96dc73442dcbc36e618e66230')
sha256sums_armv6h=('1bd75f67aa0b778ea4785b2ab64187f132519fc36c64ba94e9a406e750070efd')
sha256sums_aarch64=('8a86b45a60aa8b74fe3e69a97e1be9bb43f9fcb9f2b6b7b79b3058fc871865b6')

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
