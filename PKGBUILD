# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.129
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.129/opencode-linux-arm64.zip")
sha256sums_aarch64=('e984c8fec7c5dec930de104fe3bde2a31051cdbae00b5d782f084344c22fe676')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.129/opencode-linux-x64.zip")
sha256sums_x86_64=('47add266a8f6212d63e07eeecbff43cc306eea7d76891336ac459bae2635b036')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
