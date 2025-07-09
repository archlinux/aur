# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.13
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.13/opencode-linux-arm64.zip")
sha256sums_aarch64=('b7c5182542181b10830de73dde01fd50a447925b37feaf270246865d4d1c6376')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.13/opencode-linux-x64.zip")
sha256sums_x86_64=('1560254bb0c5a79353627f5bf5800c3fae3aaec9b2e57120c3a34bc03388fdfd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
