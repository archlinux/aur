# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.23
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.23/opencode-linux-arm64.zip")
sha256sums_aarch64=('94d337e70144e27412d14e0bd2705909104aa75be3cc0fb8dc0f7da9b50f02f0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.23/opencode-linux-x64.zip")
sha256sums_x86_64=('9167a9faf6c4b22096502fc6382d79db71a834c234576d751d2d8ce742b10b63')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
