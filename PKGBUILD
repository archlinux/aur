# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.80
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.80/opencode-linux-arm64.zip")
sha256sums_aarch64=('41e0e915e2eaa389851a6f89d33698c51729b71dd38d76a82a8dafec71939b0e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.80/opencode-linux-x64.zip")
sha256sums_x86_64=('7815317b4b58038d1f2cef5327c16265cecfd452fbe195fc573bb7ac6e461bba')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
