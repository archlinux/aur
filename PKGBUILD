# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.221
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
sha256sums_aarch64=('324fc5a9afaa6d9ca02584da92a8a7ce994112a9398fc36e0a8a6c818a6ab5c5')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('e77ffc23a2fea73594f88b26af5fb402653a44814e9b3d0e6cc3e66f6e0dc9d4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
