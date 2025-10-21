# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.11
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.11/opencode-linux-arm64.zip")
sha256sums_aarch64=('11209760b737795fedb3c54d2f7fb1518aa26b4785db29d7f6e87123d0f00d77')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.11/opencode-linux-x64.zip")
sha256sums_x86_64=('77ef4a2c41f8c379ce41bbc95a7ee36913fc425f4097ec85da7d6c546a197482')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
