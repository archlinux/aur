# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.64
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.64/opencode-linux-arm64.zip")
sha256sums_aarch64=('c453f46d68ba540c7d4cb0a9637e9d8ae31c69d10d9f9e0244a1b0e471b3ec4a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.64/opencode-linux-x64.zip")
sha256sums_x86_64=('73be337be5e2cd69622eb7440800986aa058d527512ca15637ec2e149963b62a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
