# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.65
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
sha256sums_aarch64=('6d7e755e86314314557e7278186248a6daeab316e45565e0adcf0b0189c5956e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('bfc2c018ea9bebfc5e25d473e8a82cef2d0661a4fab000deaef5df5da67ab67b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
