# Maintainer: Sean E. Russell <ser@ser1.net>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=gotop-bin
pkgver=3.5.0
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
  rm -f $srcdir/*.tgz
  install -Dm755 $srcdir/gotop* $pkgdir/usr/bin/gotop
}
sha256sums_x86_64=('25296fb369fe977fd32fd6984a6b80b64fea29a32f35b22498c6c18716cf3b19')
sha256sums_i686=('f52236d67a1968ca9b2cf918e7cd2c8f6933a1308bfa8ca81d3401e8cf75be65')
sha256sums_arm=('89772ef7f2a421e3f4c2a4bcf4225388274acfb36c53bf8cff0029c8a0d10035')
sha256sums_armv6h=('d976ebe47ebea277a956a6343409219bb8858e0d03fcf4121f9577d64c73d4e9')
sha256sums_armv7h=('f4e5bdc44b59041ab7cdc09a631aaa715af18b9ddc34b74174ccee5e359335e6')
sha256sums_aarch64=('907791e81b7f8b422d44ecb3db1e58326aa07b5ae42135bf6d7b0eae8a3c361b')
