# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.43
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('0b259c2baed039bda6393068cd66cf3a29f25294f1dfed29fc5e3210e0004d82')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('576d728e4bc1f0ece87be54ed532a0f49978cbce0c1202c39fc080ea39bdbc0b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
