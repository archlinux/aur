# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap-bin
pkgver="0.8.2"
pkgrel=1
pkgdesc='a simplistic papermc helper (pre-compiled)'
url='https://github.com/talwat/pap'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums_i686=('dd7df36f76ce4c7adfc7666d56e2ff44be4f953906228e124940d686efbfcaea')
sha256sums_x86_64=('c706b9e864622763ad22e930d6fa8c6e0021311392a527b83a8e75f4d5c3ff56')
sha256sums_armv7h=('79aa1097b9176142ee81eee2ee6659c22509feea6e70bfe1aeb72ee403d82f47')
sha256sums_armv6h=('87f6758a9dedafc9571541775aa1565180a947cdb38e0b296497de7cc5f7aba6')
sha256sums_aarch64=('a33e85bbfd1705bd770f7e5b273ab89a412befe948843884fac8d931c500031a')

source_x86_64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_x86_64")
source_i686=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_i386")
source_armv6h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv7")
source_aarch64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_arm64")

conflicts=('pap')
provides=('pap')
optdepends=('java-runtime: running the downloaded jarfiles')

package() {
  install -Dm755 pap_${pkgver}_linux_* "${pkgdir}"/usr/bin/pap
}
