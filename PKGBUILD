# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.7.2
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.7.2/opencode-linux-arm64.zip")
sha256sums_aarch64=('74a4f326d39175a8be2961b60df8e5a1aa1e39bca2691e49206eaee7376ca385')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.7.2/opencode-linux-x64.zip")
sha256sums_x86_64=('ed1a64b99b465096ede011ddcefcabb2f7e07f23d22774ef67fa1580171b8248')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
