# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.6.7
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.6.7/opencode-linux-arm64.zip")
sha256sums_aarch64=('5e18be97a64197cc2cc6f032c60280815b512bd7958ea8fea8b9fe9500372ada')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.6.7/opencode-linux-x64.zip")
sha256sums_x86_64=('3130246b638aa1d29f24f7314edd791af1ce156adaf1bd5d104ef7f32e224679')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
