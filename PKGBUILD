# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.177
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
sha256sums_aarch64=('24fb7dd350bd46044c84ac62b33a29949e9d31a19e5bcadbe54c70d8aaf4e257')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('cf4932625e23dc2add987cd5c3c6b6a42985d5826ec2bed427e45703cfba218a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
