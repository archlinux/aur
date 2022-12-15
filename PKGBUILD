# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap-bin
pkgver="0.5.0"
pkgrel=1
pkgdesc='a simplistic papermc helper (pre-compiled)'
url='https://github.com/talwat/pap'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums_i686=('297ec74f6fc58331e0bc2db7764c9d892ef60234b01239f16719c5943b51cf90')
sha256sums_x86_64=('2e23ca0d31d8e1e17d178866ef106a5cd6a600603beead0148829cf96f4bb4ae')
sha256sums_armv7h=('ad43e448018c906f03e3982faa30a8e70f4566c84a4caeae2c6c61ad943c2f13')
sha256sums_armv6h=('36566124ea487ad57e5bf60b93c25ef8f987857ca907868a388f2ee28e7f9981')
sha256sums_aarch64=('be8550b69d9daabf03d4f6f02ce1508d299d70715ee563ae37a8a6f3e0da8315')

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
