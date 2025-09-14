# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.8.0
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.8.0/opencode-linux-arm64.zip")
sha256sums_aarch64=('bef8935fe7f8af28628d3eba2623bd569735418c93593768bb654b3a65f859de')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.8.0/opencode-linux-x64.zip")
sha256sums_x86_64=('b286a3771df1348806057e9dc0cd419001de2aa6f8bf8e656d9c788ac664360d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
