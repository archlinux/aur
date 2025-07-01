# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.171
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.171/opencode-linux-arm64.zip")
sha256sums_aarch64=('394cfda38336dab81a14748f4f8e33480d870d7c9105e624ea86802d28f8ad40')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.171/opencode-linux-x64.zip")
sha256sums_x86_64=('d91362c42279c1e50dd027f76efa74bf0e72e4243969b337f27d5cf7a33cd75e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
