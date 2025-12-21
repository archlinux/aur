# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.181
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('8b5f8abc6025ad519530b3a72d68850faf6d1822b54571380ad083a27f86f202')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('254207d0a29528cb81a8c25b649c8e99ab35f37b7b1d8ef741373e446a9579c0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
