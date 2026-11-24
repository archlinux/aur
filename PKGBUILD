# Maintainer: Frezzydy <frezzydygaming@gmail.com>

name=casm
pkgname=casm-cli
pkgver=0.0.0r18.g26fb2a7
pkgrel=1
pkgdesc="A small build system for NASM projects."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/YetAnotherMechanicusEnjoyer/casm"

license=('GPL-3.0')
depends=('nasm' 'binutils')

source=("${name}-${pkgver}.tar.gz::${url}/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${name}-main"

  install -Dm755 "${name}" "${pkgdir}/usr/bin/${name}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${name}/LICENSE"
}
