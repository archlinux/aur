# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.24
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.24/opencode-linux-arm64.zip")
sha256sums_aarch64=('df051b13ae7dc903f3575761fa79dffec009357a3b759cdf2a46e7553cc11b03')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.24/opencode-linux-x64.zip")
sha256sums_x86_64=('67d63d43af72dbfda4f823d9bf2a3fdde55cbb8ce36605ddd2ad501ee3f95c97')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
