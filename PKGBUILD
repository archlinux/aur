# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.173
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.173/opencode-linux-arm64.zip")
sha256sums_aarch64=('9e89011ba19413b9f6fe7049cb3a95a909fcbbdd89a88a32a73e3cbfbaa07064')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.173/opencode-linux-x64.zip")
sha256sums_x86_64=('4c6b49fab56438a1cfbefae62fb33e6ff7e88cda17100b6b989de853dd9f3c41')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
