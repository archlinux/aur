# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.163
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
sha256sums_aarch64=('a847eed12ec2ad6a4b0ecc92b33dbe419bcc088c98bb581d282167fc035e2133')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('99e26d173ae1df92547e1025e82db34d3a0f7d3f9ef1d79bc580a66bef63080d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
