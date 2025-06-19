# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.94
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.94/opencode-linux-arm64.zip")
sha256sums_aarch64=('c5e06de4f9c275eefaa16161f38e2259ea5370071124aa259232f3e06a42449c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.94/opencode-linux-x64.zip")
sha256sums_x86_64=('691d1e6a3e84ad890c94267bcf1e7ebd27c63848e4cc81bdb5d04386190710e6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
