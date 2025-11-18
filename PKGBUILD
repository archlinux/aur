# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.76
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
sha256sums_aarch64=('b71267ee8f78f8180143ec7d1ea369d2421d0161c8f88fc067c33d1b77e60e45')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('c5070091768fda47cd3748d59d367dc68ed14c6ebda496b1204ca6cbaf021fc7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
