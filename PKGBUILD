# Maintainer: ghsc maintainers
pkgname=ghsc-bin
pkgver=0.0.10
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
sha256sums_x86_64=('fe2f7075b1d40923d892cbfa1f16251c9b2feb5d475e59957f4fffb528ca4253')
sha256sums_aarch64=('882261c14096474684938f672cc1e9449cde3fba9377f7a68da96a3b9c50d4fc')

package() {
  install -Dm755 ghsc "${pkgdir}/usr/bin/ghsc"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/ghsc/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ghsc/LICENSE"
}
