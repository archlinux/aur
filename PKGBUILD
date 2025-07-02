# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.176
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.176/opencode-linux-arm64.zip")
sha256sums_aarch64=('6a503173b7249f0c2a64932adad035d17143102ab1f349e9c7318e0d9c7fa5c1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.176/opencode-linux-x64.zip")
sha256sums_x86_64=('ee678a0159f386f42d44f1e3dbda8873964f9db272e54d0e342ab023f9285846')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
