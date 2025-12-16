# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.162
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
sha256sums_aarch64=('31b7f6c629de393b55760909d53e09c18b14d60bbc42994a88a6ecb68e05f968')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('8aaf68bf49f9bd41c8e0148581ed456715fd72eac8a8b23286c348f3dd7ddfc4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
