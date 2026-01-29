# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.1.11
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/terramind-com/terramind-cli'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('terramind')

depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-arm64.zip")
sha256sums_aarch64=('2425374200311821d8358b08f203efabd81dffbc2360fd7d376016cd434e6712')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('778fc8dc1d7d6eef843642a64d8e5129c49f844de0b6d87e0d0d6f9dd4df8814')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
