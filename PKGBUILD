# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.66
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
sha256sums_aarch64=('f7307fe430d5151ede5df3c17a05d97f1230c77c6112a241e046e26777bec80b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('2973cec4ab0b19fc33d4d10f0c5cdb3ae0234de6d2ed594963fadc7d2e4e846e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
