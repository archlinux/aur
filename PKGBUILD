# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.65
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.65/opencode-linux-arm64.zip")
sha256sums_aarch64=('40383dd54d8515a6eb935f405c809468644d4ac10e44b605b24c8d678633f8ab')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.65/opencode-linux-x64.zip")
sha256sums_x86_64=('57a217aba38b6a3951e32e56d7bf2f6c8ac67f1779e5b1710442be303d721a9f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
