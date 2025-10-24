# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.15
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.15/opencode-linux-arm64.zip")
sha256sums_aarch64=('a63608edfd3a5b5e09cf0b10aa89dc6a1d0689d42b620b354ad5f42a71b01d45')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.15/opencode-linux-x64.zip")
sha256sums_x86_64=('ededaded1698cae486cf89747d91815ff1de76552b51aee85f9695bca1928e22')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
