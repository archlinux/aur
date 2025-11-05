# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.25
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('0bb6e3c66ccb7ad736634bcdf0fde686fcda6b96416714c1b5f4588afe6af198')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('112b2696716f9843e081160e89a720ded1a27d6c3c51040ff991837030ac0aae')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
