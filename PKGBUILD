# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.113
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.113/opencode-linux-arm64.zip")
sha256sums_aarch64=('3489dac93e2cf5c372cb94f922422efbffbaf87151eac029d305cced79872f1a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.113/opencode-linux-x64.zip")
sha256sums_x86_64=('01c7ba1a654c1f5db2368649030f1ac599adbda18c7b292d0e260224d1a94660')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
