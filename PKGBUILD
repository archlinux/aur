# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.51
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
sha256sums_aarch64=('56a89a11915f10b1ae93cbdaa2c52bd823a997fce07506eddc147b52357231a1')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('8fea99a8960526f60011792699e05752966a49b5fd4e85dbb420b28508e0eb57')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
