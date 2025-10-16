# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.6
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.6/opencode-linux-arm64.zip")
sha256sums_aarch64=('783d64fbd56709bae9776dfc4e5128b2bb420b04457a6e68bea570c160530fae')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.6/opencode-linux-x64.zip")
sha256sums_x86_64=('7ca828b7864019859913dde1dc2afa8584bee3bfd4cc611afd11604f8a043abd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
