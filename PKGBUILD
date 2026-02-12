# Maintainer: ghsc maintainers
pkgname=ghsc-bin
pkgver=0.0.17
pkgrel=1
pkgdesc="Ultra-short shortcuts for GitHub CLI workflows (prebuilt binaries)"
arch=('x86_64' 'aarch64')
url='https://github.com/hassanecoder/ghsc'
license=('MIT')
depends=('git' 'github-cli')
provides=('ghsc')
conflicts=('ghsc' 'ghsc-git')
options=('!debug')
source_x86_64=("ghsc-${pkgver}-linux-amd64.tar.gz::https://github.com/hassanecoder/ghsc/releases/download/v${pkgver}/ghsc-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("ghsc-${pkgver}-linux-arm64.tar.gz::https://github.com/hassanecoder/ghsc/releases/download/v${pkgver}/ghsc-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('f3e8e72c9424c6ddbbf5b62a24144868c7bfbdf644e23ced02122f76136a5ee2')
sha256sums_aarch64=('9453f61b44b987d43128bbfa0b6f7f07431d1b7b5b00710ac41a6c1099032e5a')

package() {
  install -Dm755 ghsc "${pkgdir}/usr/bin/ghsc"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/ghsc/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ghsc/LICENSE"
}
