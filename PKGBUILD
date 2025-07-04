# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.190
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.190/opencode-linux-arm64.zip")
sha256sums_aarch64=('abf657f04ba3a345a2bc545a78e1327e875c2cc9fd1c2526d63036d0201629a0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.190/opencode-linux-x64.zip")
sha256sums_x86_64=('7f05132550f088a3ce30ee2c1c9ed79d44951dbbe6c4cbfb1fc800e91e001ac6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
