# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.25
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('740865cf472bcab47d2e4d37f0e0abe4b3755731874839128fe788e99395a0a8')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('cab27bac5ae5f3706263e573c815cd724eafad54ef964867db36278181e64611')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
