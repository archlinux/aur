# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.138
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
sha256sums_aarch64=('700ce2715c4b5ea99ae84454f74b345064ea6f66125dd9511a1c37489a4c5506')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('89d0344d88cc323f06205ba05bc8e818c0c87944e01d28e2d4ff98c1305ea146')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
