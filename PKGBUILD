# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.35
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
sha256sums_aarch64=('506b5302f93299d4773ca739e8b68138f169cc81deb2bf6930f9f34bce453bb4')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('2e35643de90e5315177e31969ab1cf2af55a8ba9391e5c348f48381bf30c1010')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
