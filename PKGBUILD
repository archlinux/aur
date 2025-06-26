# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.146
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.146/opencode-linux-arm64.zip")
sha256sums_aarch64=('0e0603b19dfed9063129013b22ed726ecd4c20baf4c150b6a0c1f2f4628930be')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.146/opencode-linux-x64.zip")
sha256sums_x86_64=('8ccfc367d4fb76b22af77de6808e3425203401824c62c8f26f0fc24e53ae4bba')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
