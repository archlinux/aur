# Maintainer: toxdes <hi@toxdes.com>
pkgname=mousr-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Keyboard-driven mouse control for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/mousr"
license=('MIT')
depends=('wayland' 'libxkbcommon')
provides=("mousr=${pkgver}")
conflicts=(mousr)

source_x86_64=("mousr-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/mousr_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('a4dcea5ce926280a4f349991fc5918f42cbe7ec2490e2305e7fc1c2d23dd9982')

source_aarch64=("mousr-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/mousr_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('0f8895e89a564d7cfcdbd646413be0196a57b17423ce85edbe563da43c1c9fc0')

package() {
  bsdtar -xf "${srcdir}/mousr-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
