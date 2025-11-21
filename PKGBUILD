# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.88
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
sha256sums_aarch64=('857586c577360feadc1f558d69b3906626491277abd70e4f76745995f7a7081c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('5c839593af12d9e0457ca8d5949b2e8ddac4d38f1d65b840e6ec56716a90e9f0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
