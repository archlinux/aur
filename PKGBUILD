# Maintainer: Sean E. Russell <ser@ser1.net>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=gotop-bin
pkgver=4.2.0
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
sha256sums_x86_64=('7dbf3619f07b82a8a6145dce7ad8149067550dd950e4f2ca54208b45380394b7')
sha256sums_i686=('eecf007f12e8e52ab76f363603dbedd0906790f6c3c8c52304c1ac9e9c83d2e8')
sha256sums_arm=('2543431961863202f57a1d4c52439a254e1d62c9a95f5cb34b8843800983f50a')
sha256sums_armv6h=('d0d70ace1533ecbd50a7f9172457ee5b4a0101cc4c65099d85c88d11f45c1cbe')
sha256sums_armv7h=('18263e1d6c391cbac397b35d662654d2fb18eb81f3a32bb5f12148362ca26f96')
sha256sums_aarch64=('eda4be392d641c5a654adbe2606c8a2a045117ea6a6dd1a5f4454c3326fc5987')
