# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.13
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.13/opencode-linux-arm64.zip")
sha256sums_aarch64=('2e79d5bd850222078b6d714d5d0db8f63b25e7f278748d62d775ef3d8b1739de')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.13/opencode-linux-x64.zip")
sha256sums_x86_64=('c91dc4a97534fd2a4a6d86a5dd839c00f40b9128e2fe3d480ac8a23e2a284da7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
