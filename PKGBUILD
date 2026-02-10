# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.55
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('0d1112c8dfe31dda9f75dafc0c1865c0f560a18b850cd37abaf0696f29937ed9')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('48d33b5b55e59d47baa9a813d34b2ac6cf0a5055d123b0c79790dc1fd230a9f4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
