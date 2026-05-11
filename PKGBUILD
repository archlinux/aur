# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.47
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('f0b44fffa1a68912866f0c60989aceb4e9308fb1f8f1d1b40aefceb32b3a4c5e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('41cb25242814465fc29ef17c5206944778374fd62628c6d5c8c8394bcf01c247')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
