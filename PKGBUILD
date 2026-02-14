pkgname=lectic-bin
pkgver=0.0.2
pkgrel=1
pkgdesc='unixy LLM toolbox'
arch=('x86_64' 'aarch64')
url='https://github.com/gleachkr/Lectic'
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=(
  "lectic-v0.0.2-linux-x86_64.tar.gz::https://github.com/gleachkr/Lectic/releases/download/v0.0.2/lectic-v0.0.2-linux-x86_64.tar.gz"
)
source_aarch64=(
  "lectic-v0.0.2-linux-aarch64.tar.gz::https://github.com/gleachkr/Lectic/releases/download/v0.0.2/lectic-v0.0.2-linux-aarch64.tar.gz"
)
sha256sums_x86_64=('caafedceb52b8a7e6690ffe61e0cf08d01bb541f996a2f9ca9df1c46306a29d3')
sha256sums_aarch64=('512e30591182cd1d541f63dbd976bfbdf20077441959c465d9e39617af691462')

package() {
  install -Dm755 "${srcdir}/lectic" "${pkgdir}/usr/bin/lectic"
}
