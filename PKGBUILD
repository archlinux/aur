# Maintainer: Sean E. Russell <ser@ser1.net>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=gotop-bin
pkgver=4.1.4
pkgrel=1
pkgdesc="A terminal based graphical activity monitor inspired by gtop and vtop"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/xxxserxxx/gotop"
license=("AGPL3")
provides=("gotop")
conflicts=("gotop")
depends=("glibc")
source_x86_64=("https://github.com/xxxserxxx/gotop/releases/download/v$pkgver/gotop_v${pkgver}_linux_amd64.tgz")
source_i686=("https://github.com/xxxserxxx/gotop/releases/download/v$pkgver/gotop_v${pkgver}_linux_386.tgz")
source_arm=("https://github.com/xxxserxxx/gotop/releases/download/v$pkgver/gotop_v${pkgver}_linux_arm5.tgz")
source_armv6h=("https://github.com/xxxserxxx/gotop/releases/download/v$pkgver/gotop_v${pkgver}_linux_arm6.tgz")
source_armv7h=("https://github.com/xxxserxxx/gotop/releases/download/v$pkgver/gotop_v${pkgver}_linux_arm7.tgz")
source_aarch64=("https://github.com/xxxserxxx/gotop/releases/download/v$pkgver/gotop_v${pkgver}_linux_arm64.tgz")

package() {
  install -Dm755 "$srcdir/gotop" "$pkgdir/usr/bin/gotop"
}
sha256sums_x86_64=('85878a570988a18b65481fa9968fd05472888d03c89585c09bf72af52b1e11f6')
sha256sums_i686=('89484f9e009257e5c08a6979ce313458bab2deac959d0dc6a3a98565b2e50029')
sha256sums_arm=('a0a3105443ec800a91aa7e7e8cd9eee3b8a2a33c69783cd871e5ed1c1c726d8a')
sha256sums_armv6h=('6bb9a3dc460b0c02c960a19fbb682e44f39668b66e668ed8c071b47f5064a83a')
sha256sums_armv7h=('5ad8eb76642d6928446377882924965a366a4d1ed5eff1b3112e02a36e28677c')
sha256sums_aarch64=('7f89c3491468d764fb46f982a6b800d11c6e17e5189158df7b3a4dadad02f23c')
