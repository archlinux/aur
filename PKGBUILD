# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.1
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
sha256sums_aarch64=('887e2ba8370895e8c20a0d9648413afdeadc1c8197685da8ce2b5c7a5c72bae0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('9ecce27cf529ade5f177fab478b4876b5c31d9ddc8216b994816acf192159511')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
