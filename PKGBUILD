# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.58
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.58/opencode-linux-arm64.zip")
sha256sums_aarch64=('fc206e94bad93e4b6f1c47e89888470097304371b8f80c34419e041e8139e497')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.58/opencode-linux-x64.zip")
sha256sums_x86_64=('267ffd39dee6efe34ed2804f3358c172b7b2804e41816432522133e05408af48')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
