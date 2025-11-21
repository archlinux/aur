# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.87
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
sha256sums_aarch64=('101fdb1b2f5614c563acdae7552bea0a72df14586bfe31d9265545cd5b772c01')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('f4bd373f8c5161c72be9fb6a4e1abf2c395a2f98fb8eb7313c135674be325ade')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
