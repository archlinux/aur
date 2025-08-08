# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.0
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.0/opencode-linux-arm64.zip")
sha256sums_aarch64=('acd35caf6021b74fd01577fe74276700a42de3c19b2fbb731b8f599451d67a34')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.0/opencode-linux-x64.zip")
sha256sums_x86_64=('703f7bef12160fd5a54527f76ffcd0e79aeec3446e8ee0b5fbd3c26b9b43c3be')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
