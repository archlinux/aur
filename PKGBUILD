# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.14
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.14/opencode-linux-arm64.zip")
sha256sums_aarch64=('33d59e43f69d42800cadbc6b5259305971e1f16f0d9a41ba99ef298911350597')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.14/opencode-linux-x64.zip")
sha256sums_x86_64=('b44f02c23fb604d9861f2f26b2edcf4e7ac986353f17abafbaf17537087e4f25')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
