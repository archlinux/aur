# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.30
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('08b65c6607da64e2c1b22b5c9254696bbcc1bc9b6393c4f3c2e32026dc5200c0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('7808f24491754ce9999eb242bb4e2cbf7b0fb2060a0b6a4852c1b0c8baf91a37')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
