# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.112
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.112/opencode-linux-arm64.zip")
sha256sums_aarch64=('6ceae43795a62b572866e50d30d99e266889b6aeae1da058aab34041cc5d49d8')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.112/opencode-linux-x64.zip")
sha256sums_x86_64=('ce02926bbe94ca91c5a46e97565e3f8d275f1a6c2fd3352f7f99f558f6b60e09')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
