# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.187
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.187/opencode-linux-arm64.zip")
sha256sums_aarch64=('d8485102c7a97c5bd8bdb6f3ff5430ba98d4a00b6bf6729fc4a5ab5e4ff476f9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.187/opencode-linux-x64.zip")
sha256sums_x86_64=('0ac1e523bd7a5eecf0156f1a2f1e824c73ba59b8004043445dc659639a98d376')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
