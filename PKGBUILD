# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.207
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
sha256sums_aarch64=('0eee09e9d155b9856144beafd84374f7c6aa3bb22832f530314b032e8a24305f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('de9b53d8cfb5c341bfd05c4ad1d8e650ea8f7676edf5312cb76d78b017b25c2b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
