# Maintainer: toxdes <hi@toxdes.com>
pkgname=mousr-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Keyboard-driven mouse control for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/mousr"
license=('MIT')
depends=('wayland' 'libxkbcommon')
provides=("mousr=${pkgver}")
conflicts=(mousr)

source_x86_64=("mousr-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/mousr_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('13b352754b341e57b1cbcf49ad282363a56d77ade27ff025eaa1fa80fda6872b')

source_aarch64=("mousr-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/mousr_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('10998a7fac82477328fe38bd34198bcbb7d2c20004c70f57d2f65f709ad30311')

package() {
  bsdtar -xf "${srcdir}/mousr-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
