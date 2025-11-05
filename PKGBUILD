# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.24
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
sha256sums_aarch64=('7e8e76c417727f549a092524ff189c3b71f71c4189dd4ccf3505bb4d963cafe1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('1db4bfc52e508dd382d10a378b00845da9c45289dafba4706470dce82645ec7f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
