# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.50
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
sha256sums_aarch64=('22ec31d34907fe1f6248eb08146d1e74413edeedd3d912a79108a4e7a6c6f2a2')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('0f15aed46182a4c64caf657df76ecae6f78a020a4c967ec50e50d99bec31bf69')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
