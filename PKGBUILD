# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.56
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
sha256sums_aarch64=('2c9db552891768b6a4e9f6bcc14443c2a38d35422d8dd466d305d96b274f8c97')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('ef04f81f773e25fd244e87e803d33e4d4b752c60d8e65cab2254acb271e367ff')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
