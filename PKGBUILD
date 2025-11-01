# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.9
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
sha256sums_aarch64=('7d2539e235177ccba96ffd31123bf42f4b2a965df095ab190fbd09b9afc6514d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('bae154544f745e62c9cd84ae3c7faad6532093f9166696110d09af5cf9be751f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
