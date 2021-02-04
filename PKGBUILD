# Maintainer: Sean E. Russell <ser@ser1.net>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=gotop-bin
pkgver=4.1.1
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
sha256sums_x86_64=('ed488b3751a23a65db189a271c5e5a8ca40c9b38a0b035928d202b39721ac2e3')
sha256sums_i686=('489018c12a471c8fb47e6ce36af5e681d30a943aca8f67868b7f8e985a5682b5')
sha256sums_arm=('c449227b298042b8bf0dddbd7c211a1a6f022ccbc957e2dfb5f226bef48b3d57')
sha256sums_armv6h=('24cddca2e95ac475766f0dcbbb01cc1210a29062c1691ea2f2375d476f3251e6')
sha256sums_armv7h=('134912f4443c73a484234a89fd7c18b709f8edf9a3e4084238ec1749c8a88c38')
sha256sums_aarch64=('d6ebfc280ae12498f5cf5cad9583d57142abdb8080e43d0fc6a9280519105688')
