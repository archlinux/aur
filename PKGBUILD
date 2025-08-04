# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.128
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.128/opencode-linux-arm64.zip")
sha256sums_aarch64=('fd38e16748edd0f067000dad4e878b148f347547989a2cc6f1d33fb89698d969')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.128/opencode-linux-x64.zip")
sha256sums_x86_64=('b1f793a9a48bcea79afd475563e11e517a3b3b95b480a38c062c38fd5b26e7d9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
