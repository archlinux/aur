# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.9
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.9/opencode-linux-arm64.zip")
sha256sums_aarch64=('c105f8c37fb1296e279fc4237880bc13194972e0b6ea4060620e5acb268450ec')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.9/opencode-linux-x64.zip")
sha256sums_x86_64=('cf0fcd4d3c6c501890d73b3420bbed89ab77dc4d11aa068580a0095909bc626f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
