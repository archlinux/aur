# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.126
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
sha256sums_aarch64=('27fbe5b16c11d9482540dd839125b93d97c7bc335aa7efbd216781839c056867')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('20416a35e21644a4748ae2744849c066889966d395a333312b50d8615bc49a2d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
