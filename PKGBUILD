# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.198
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('0483e2a5ac1592382d7c5f5a779644912e983d01d900c911caa0a01f0840dfca')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('2131a963bd909bd52fc857c28f648e3703a93bfafd3c362ff1395a3f59215674')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
