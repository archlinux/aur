# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.11.4
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.11.4/opencode-linux-arm64.zip")
sha256sums_aarch64=('ddd5b1823aaa9aabd36617b6b65fbded00c5cd471c26df6930839e2919e6d3d3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.11.4/opencode-linux-x64.zip")
sha256sums_x86_64=('4dc8a84d243b5390fd56de1ce5ffeb40c058b202732107a76b49d5161b8e6911')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
