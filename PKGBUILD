# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.57
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.57/opencode-linux-arm64.zip")
sha256sums_aarch64=('ce3415ca123d1b2446332d589659b707f8e6c46a7941623d4f76555aff7c4acd')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.57/opencode-linux-x64.zip")
sha256sums_x86_64=('3d1f07250e250923f22d680ab041ece86baa3d2a5a1218f9f0bf54046106d519')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
