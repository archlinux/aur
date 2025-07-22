# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.55
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.55/opencode-linux-arm64.zip")
sha256sums_aarch64=('ce0bcf81356aa6dd86d934468388be407a2f96645e44684870a118f58bb317bc')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.55/opencode-linux-x64.zip")
sha256sums_x86_64=('e0e99307e075139739e9cada6fdd6e58c89219eb10335a94738b0bf2ff7b78c8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
