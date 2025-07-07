# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.4
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.4/opencode-linux-arm64.zip")
sha256sums_aarch64=('6f1d9e76f7230cd3f170de16f8dab69c0b94e1d192e4f109d3dd5e9a39802460')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.4/opencode-linux-x64.zip")
sha256sums_x86_64=('f2b05917523b981ed55284f23ff04e3c411da5d794ad28fe2a7a8faeddafd49c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
