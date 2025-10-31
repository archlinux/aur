# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.4
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
sha256sums_aarch64=('b009869b594a24f1e2b44c3b5d91880bb37a3595b0dc179fe70dbe57a298edcc')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('e66ba76ba2d2abb9ac777acd92f940246c52891b743981081b2284e2e98b95cc')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
