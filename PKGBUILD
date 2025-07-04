# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.188
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.188/opencode-linux-arm64.zip")
sha256sums_aarch64=('32b4db044bb3a3e1811611fc70b7fa29e6f3e997fbca5dccc079a1096595dfc8')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.188/opencode-linux-x64.zip")
sha256sums_x86_64=('595800c9e0ed1841263ff9c59b3c45d8f32c02f22732d30857e31ef7f16cf21e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
