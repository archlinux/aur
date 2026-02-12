# Maintainer: ghsc maintainers
pkgname=ghsc-bin
pkgver=0.0.16
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
sha256sums_x86_64=('fc39c8ef489895a8fb2cc7f46293915b9f41ba9618f109d9604826297ae4ff8f')
sha256sums_aarch64=('25846245eacd600f8ed9f4c680feab6553f8a4509ee583435fc26f509a9f22cf')

package() {
  install -Dm755 ghsc "${pkgdir}/usr/bin/ghsc"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/ghsc/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ghsc/LICENSE"
}
