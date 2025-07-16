# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.13
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.13/opencode-linux-arm64.zip")
sha256sums_aarch64=('2fae6c2f1b1b960bf7f8470a0a186dce1762d26a09fe6f6c4ca7443f672afda7')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.13/opencode-linux-x64.zip")
sha256sums_x86_64=('0826b014e5d38ef94b18c60d254d6cc68099ffbdda86381adc49e5bf8f5d06e5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
