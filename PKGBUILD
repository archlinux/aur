# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap-bin
pkgver="0.3.2"
pkgrel=1
pkgdesc='a simplistic papermc helper (pre-compiled)'
url='https://github.com/talwat/pap'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums_i686=('56ba5966a3b3cfd01a8c9553ae56fe6a741dd4efd80455e4255ffe91610a2f48')
sha256sums_x86_64=('b6bf5e4768dba84ae821a23ca646034cdea7ad2ba7816ee7659668b5711e5500')
sha256sums_armv7h=('8cd75c8aa499610b34dcdc86ae4ebaa3188635f9ac31ec6a36e51fe877cbd17d')
sha256sums_armv6h=('37d87469786d1703bba3d1cdce5e654369a4ed878cc75e52e7db5d675c9f1f5e')
sha256sums_aarch64=('cf60e2db4ce3e764b4161957aea2fc6f8cbfbf36128df021a31d2e472992a22f')

source_x86_64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_x86_64")
source_i686=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_i386")
source_armv6h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv7")
source_aarch64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_arm64")

conflicts=('pap')
provides=('pap')
depends=('git' 'pacman')

package() {
  install -Dm755 pap_${pkgver}_linux_* "${pkgdir}"/usr/bin/pap
}
