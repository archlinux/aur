# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.17
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.17/opencode-linux-arm64.zip")
sha256sums_aarch64=('8b309d5e1f9db89e77ec02d4bba14a1f48ab7f74e0ad2069dc11a3f398b75f1d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.17/opencode-linux-x64.zip")
sha256sums_x86_64=('6d796906760d81e5f3c31cc3be6037c53cfcb9555be3764779afa80c826198af')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
