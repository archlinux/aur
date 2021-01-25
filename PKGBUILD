# Maintainer: Sean E. Russell <ser@ser1.net>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=gotop-bin
pkgver=4.1.0
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
sha256sums_x86_64=('3b6f493571eb8a1cb72cad3f57d1aba762acbcb7c7a1aff4e68ca9baef5fb006')
sha256sums_i686=('abadb6253c94eafa9577fca0f1c22f40a8360234ba2a8d2719c2900769990f2b')
sha256sums_arm=('65ed9ecc49ad01feef8f72c677b76635575400299d104c3830962feee1eeeb00')
sha256sums_armv6h=('d22600cc9745ab0ca60e9aaf9aa26b65a6dd7e4affcf2c95692c4891cde5b28e')
sha256sums_armv7h=('294cc9ef8d643cc0e7b5275ab650247c6a69117ab952129635ff04716d1638b2')
sha256sums_aarch64=('7d482d911a39c46e29d719a0cb81eda2f8a604eed5b9abebccc9b73892092958')
