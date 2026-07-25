# Maintainer: Steven Terwindt <aur@sbbh.cloud>
pkgname=statemate-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Declarative system configuration management"
arch=('x86_64' 'aarch64')
url="https://github.com/subbeh/statemate"
license=('MIT')
provides=('statemate')
conflicts=('statemate')
source_x86_64=("${url}/releases/download/v${pkgver}/statemate_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/statemate_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 mate "${pkgdir}/usr/bin/mate"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
