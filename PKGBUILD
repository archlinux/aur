# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.6.6
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.6.6/opencode-linux-arm64.zip")
sha256sums_aarch64=('370336930b7c43575caba57e57eabaeea72b093fd1ee8d13981fbdfe548473f0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.6.6/opencode-linux-x64.zip")
sha256sums_x86_64=('b9b4fcd4886f4567f1e2537ffca8dcefaf6d130d0d69255acf8e7f6013720323')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
