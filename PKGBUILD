# Maintainer: Sean E. Russell <ser@ser1.net>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=gotop-bin
pkgver=4.1.2
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
sha256sums_x86_64=('685bd69d4c1fe0b6af4e075036dd68ea14ecd42c51c2151457758b7faecac898')
sha256sums_i686=('ab4fc6aa0375e2ec1337042894fb1b16df6c0bc4877de443e6c15551c589d3c3')
sha256sums_arm=('e64726174cc72ceab24f3173e8a8f6bdd14246a1ea99ab50938c3caf02af0ff0')
sha256sums_armv6h=('ce7addd24435bb91a749b8c22355458aeb1983393fe870dbcaf560d0d2fcc1c3')
sha256sums_armv7h=('33bf20347fc27c67486484c0b281a810541731ac302b4e059368a5b579d5da79')
sha256sums_aarch64=('671f6756c3468cfea16afd679e3807e954c7b920d27dd13a0755eb48ea0021a6')
