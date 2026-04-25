# Maintainer: Paulo Diovani Gonçalves <paulo at diovani dot com>

pkgname=opencode-vim-bin
pkgver=1.14.25
_ocvver=3.28
pkgrel=1
pkgdesc="AI coding agent for terminal (vim fork with enhanced vim features)"
options=('!debug' '!strip')
arch=('x86_64' 'aarch64')
url="https://github.com/leohenon/opencode-vim"
license=('MIT')
depends=('gcc-libs' 'glibc')

source_aarch64=("ocv-linux-arm64.tar.gz::https://github.com/leohenon/opencode-vim/releases/download/v${pkgver}-ocv.${_ocvver}/ocv-linux-arm64.tar.gz")
source_x86_64=("ocv-linux-x64.tar.gz::https://github.com/leohenon/opencode-vim/releases/download/v${pkgver}-ocv.${_ocvver}/ocv-linux-x64.tar.gz")

sha256sums_aarch64=('caeccd131cb52504c01e20035af965eb5625cd08750b1f77c9282fc8c20b41d5')
sha256sums_x86_64=('37ef7a6ca37521f98d1a5b15f7c15bcb7b3c22095b57e7bfd08ec3555e77f88f')

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/ocv"
}
