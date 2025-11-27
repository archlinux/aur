# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.118
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('c2a5166f133fc0718f7f81b31742ab4b73f310f99c8d74db6703e880d59f422d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0128fe6c5372b5dc94464b030c9acb9db9516921d58c348b99ad1de347ca6d4c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
