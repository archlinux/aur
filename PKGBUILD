# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.21
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.21/opencode-linux-arm64.zip")
sha256sums_aarch64=('c04f36d8d98286719f0027359a3098d7b269108992e574436f927500947e1585')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.21/opencode-linux-x64.zip")
sha256sums_x86_64=('25a52e93b84ef35d1829cb43b88f931256c3a04ea0d4649698505103a48e77eb')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
