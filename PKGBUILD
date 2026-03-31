pkgname=lectic-bin
pkgver=0.0.3
pkgrel=1
pkgdesc='unixy LLM toolbox'
arch=('x86_64' 'aarch64')
url='https://github.com/gleachkr/Lectic'
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=(
  "lectic-v0.0.3-linux-x86_64.tar.gz::https://github.com/gleachkr/Lectic/releases/download/v0.0.3/lectic-v0.0.3-linux-x86_64.tar.gz"
)
source_aarch64=(
  "lectic-v0.0.3-linux-aarch64.tar.gz::https://github.com/gleachkr/Lectic/releases/download/v0.0.3/lectic-v0.0.3-linux-aarch64.tar.gz"
)
sha256sums_x86_64=('02d9c6fffa47b43897cb9a50ac5c04002c46facad71a2f5bd2e95db8ebad82fc')
sha256sums_aarch64=('f43c195000970a798fa91c1cc6b9770de01a9a0b0bd689387e31233fbd02098c')

package() {
  install -Dm755 "${srcdir}/lectic" "${pkgdir}/usr/bin/lectic"
}
