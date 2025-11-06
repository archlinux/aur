# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.35
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
sha256sums_aarch64=('c8f14581f053b99261283e7628c224ef05f44532d4ebd87714680a61ac587b5d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('fedcfcf4ad2ab49216f451973a5c7a308a545bf2251c120599e8ef91d27787c0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
